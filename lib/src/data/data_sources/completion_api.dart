import 'dart:convert';

import 'package:http/http.dart';
import 'package:lms_pptik/src/utils/endpoints.dart';

abstract class CompletionApi {
  Future<bool> setCompletionStatus(String token, int cmId, int completed);
}

class CompletionApiImpl implements CompletionApi {
  final Client client;

  CompletionApiImpl(this.client);

  @override
  Future<bool> setCompletionStatus(
      String token, int cmId, int completed) async {
    Uri url = Uri.https(Endpoints.baseUrl, Endpoints.rest, {
      'wstoken': token,
      'wsfunction':
          'core_completion_update_activity_completion_status_manually',
      'moodlewsrestformat': 'json',
      'cmid': cmId.toString(),
      'completed': completed.toString(),
    });

    final response = await client.post(url);
    if (response.statusCode == 200) {
      final result = json.decode(response.body);

      if (result['status'] == true) return true;

      return false;
    } else {
      throw Exception();
    }
  }
}
