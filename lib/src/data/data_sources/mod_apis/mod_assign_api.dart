part of 'mod_apis.dart';

abstract class ModAssignApi {
  Future<List<AssignmentModel>> getModAssignment(String token, int courseId);

  Future<SubmissionStatusModel> getSubmissionStatus(String token, int assignId);

  Future<bool> submitSubmission(String token, int assignId, int itemId);

  Future<bool> viewAssignment(String token, int assignId);
}

class ModAssignApiImpl implements ModAssignApi {
  final Client client;

  ModAssignApiImpl(this.client);

  @override
  Future<List<AssignmentModel>> getModAssignment(
      String token, int courseId) async {
    Uri url = Uri.https(Endpoints.baseUrl, Endpoints.rest, {
      'wstoken': token,
      'wsfunction': 'mod_assign_get_assignments',
      'moodlewsrestformat': 'json',
      'courseids[0]': courseId.toString(),
    });

    final response = await client.get(url);
    if (response.statusCode == 200) {
      final result =
          json.decode(response.body)['courses'][0]['assignments'] as List;
      if (result.isEmpty) {
        return <AssignmentModel>[];
      }
      return result
          .map<AssignmentModel>((e) => AssignmentModel.fromJson(e))
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<SubmissionStatusModel> getSubmissionStatus(
      String token, int assignId) async {
    Uri url = Uri.https(Endpoints.baseUrl, Endpoints.rest, {
      'wstoken': token,
      'wsfunction': 'mod_assign_get_submission_status',
      'moodlewsrestformat': 'json',
      'assignid': assignId.toString(),
    });

    final response = await client.get(url);
    if (response.statusCode == 200) {
      final result = json.decode(response.body) as Map<String, dynamic>;
      return SubmissionStatusModel.fromJson(result);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<bool> submitSubmission(String token, int assignId, int itemId) async {
    Uri url = Uri.https(
        Endpoints.baseUrl,
        Endpoints.rest,
        {
          'wstoken': token,
          'wsfunction': 'mod_assign_save_submission',
          'moodlewsrestformat': 'json',
          'assignmentid': assignId,
          'plugindata[files_filemanager]': itemId,
        }.map((key, value) => MapEntry(key, value.toString())));
    final response = await client.get(url);
    if (response.statusCode == 200) {
      final result = json.decode(response.body) as List;
      log('LOG SUBMIT SUBMISSION $result');
      if (result.isEmpty) {
        return true;
      } else if (result[0]['warningcode'] == 'couldnotsavesubmission') {
        throw NotFoundException(result[0]['item']);
      }
      return false;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<bool> viewAssignment(String token, int assignId) async {
    Uri url = Uri.https(
        Endpoints.baseUrl,
        Endpoints.rest,
        {
          'wstoken': token,
          'wsfunction': 'mod_assign_view_assign',
          'moodlewsrestformat': 'json',
          'assignid': assignId.toString(),
        }.map((key, value) => MapEntry(key, value.toString())));
    final response = await client.get(url);

    if (response.statusCode == 200) {
      final result = json.decode(response.body) as Map<String, dynamic>;

      if (result['status'] == true) {
        return true;
      }
      return false;
    } else {
      throw ServerException();
    }
  }
}
