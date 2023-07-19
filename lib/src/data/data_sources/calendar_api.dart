import 'dart:convert';

import 'package:http/http.dart';
import 'package:lms_pptik/src/data/models/event_model.dart';

import '../../utils/endpoints.dart';
import '../../utils/exceptions.dart';

abstract class CalendarApi {
  Future<List<EventModel>> getAllEvent(String token);
}

class CalendarApiImpl implements CalendarApi {
  final Client client;

  CalendarApiImpl(this.client);
  @override
  Future<List<EventModel>> getAllEvent(String token) async {
    Uri url = Uri.https(Endpoints.baseUrl, Endpoints.rest, {
      'wstoken': token,
      'wsfunction': 'core_calendar_get_calendar_events',
      'moodlewsrestformat': 'json',
    });
    final response = await client.get(url);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body)['events'];
      if (result.isEmpty) {
        return <EventModel>[];
      }
      return result.map<EventModel>((e) => EventModel.fromJson(e)).toList();
    } else {
      throw ServerException();
    }
  }
}
