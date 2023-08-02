import 'dart:convert';

import 'package:http/http.dart';
import 'package:lms_pptik/src/data/models/event_model.dart';

import '../../utils/endpoints.dart';
import '../../utils/exceptions.dart';

abstract class CalendarApi {
  Future<List<EventModel>> getAllEvent(String token);
  Future<bool> addEvent(String token, EventModel event, int repeat);
  Future<bool> deleteEvent(String token, int eventId, bool deleteAllRepeated);
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

  @override
  Future<bool> addEvent(String token, EventModel event, int repeat) async {
    Uri url = Uri.https(Endpoints.baseUrl, Endpoints.rest, {
      'wstoken': token,
      'wsfunction': 'core_calendar_create_calendar_events',
      'moodlewsrestformat': 'json',
      'events[0][name]': event.name,
      'events[0][description]': event.description ?? '',
      'events[0][timestart]': event.timestart.toString(),
      'events[0][timeduration]': event.timeduration.toString(),
      'events[0][repeats]': repeat.toString(),
    });

    final response = await client.get(url);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body)['events'][0]['id'];
      if (result == null) {
        return false;
      }
      return true;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<bool> deleteEvent(
      String token, int eventId, bool deleteAllRepeated) async {
    Uri url = Uri.https(Endpoints.baseUrl, Endpoints.rest, {
      'wstoken': token,
      'wsfunction': 'core_calendar_delete_calendar_events',
      'moodlewsrestformat': 'json',
      'events[0][eventid]': eventId.toString(),
      'events[0][repeat]': deleteAllRepeated ? '1' : '0',
    });

    final response = await client.get(url);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      if (result == null) {
        return true;
      }
      return false;
    } else {
      throw ServerException();
    }
  }
}
