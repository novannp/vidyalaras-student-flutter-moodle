part of 'mod_apis.dart';

abstract class ModResourceApi {
  Future<List<ResourceModel>> getResourceByCourse(String token, int courseId);
  Future<bool> viewResource(String token, int resourceId);
}

class ModResourceApiImpl implements ModResourceApi {
  final Client client;

  ModResourceApiImpl(this.client);

  @override
  Future<List<ResourceModel>> getResourceByCourse(
      String token, int courseId) async {
    Uri url = Uri.https(Endpoints.baseUrl, Endpoints.rest, {
      'wstoken': token,
      'wsfunction': 'mod_resource_get_resources_by_courses',
      'moodlewsrestformat': 'json',
      'courseids[0]': courseId.toString(),
    });

    final response = await client.get(url);
    if (response.statusCode == 200) {
      final result = json.decode(response.body)['resources'] as List;
      if (result.isEmpty) {
        return <ResourceModel>[];
      }
      return result
          .map<ResourceModel>((e) => ResourceModel.fromJson(e))
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<bool> viewResource(String token, int resourceId) async {
    Uri url = Uri.https(Endpoints.baseUrl, Endpoints.rest, {
      'wstoken': token,
      'wsfunction': 'mod_resource_view_resource',
      'moodlewsrestformat': 'json',
      'resourceid': resourceId.toString(),
    });

    final response = await client.get(url);
    if (response.statusCode == 200) {
      final result = json.decode(response.body)['status'];
      return result;
    } else {
      throw ServerException();
    }
  }
}
