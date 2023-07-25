import 'dart:convert';

import 'package:http/http.dart';

import '../../utils/endpoints.dart';
import '../../utils/exceptions.dart';
import '../models/notification_model.dart';

abstract class NotificationApi {
  Future<List<NotificationModel>> getNotifications(String token, String userId);

  Future<int> getNotificationCount(String token, int userId);
}

class NotificationApiImpl implements NotificationApi {
  final Client client;

  NotificationApiImpl(this.client);

  @override
  Future<List<NotificationModel>> getNotifications(
      String token, String userId) async {
    Uri urlUnread = Uri.https(
      Endpoints.baseUrl,
      Endpoints.rest,
      {
        'wstoken': token,
        'wsfunction': 'core_message_get_messages',
        'moodlewsrestformat': 'json',
        'useridto': userId.toString(),
        'read': 0,
      }.map((key, value) => MapEntry(key, value.toString())),
    );
    Uri urlRead = Uri.https(
      Endpoints.baseUrl,
      Endpoints.rest,
      {
        'wstoken': token,
        'wsfunction': 'core_message_get_messages',
        'moodlewsrestformat': 'json',
        'useridto': userId.toString(),
        'read': 1,
      }.map((key, value) => MapEntry(key, value.toString())),
    );

    final response = await client.get(urlUnread);
    final response2 = await client.get(urlRead);

    if (response.statusCode == 200 && response2.statusCode == 200) {
      final notificationRead = jsonDecode(response.body)['messages'] as List;
      final notificationUnRead = jsonDecode(response2.body)['messages'] as List;
      if (notificationRead.isEmpty && notificationUnRead.isEmpty) {
        return <NotificationModel>[];
      } else {
        final notificationUnreadModel =
            notificationRead.map((e) => NotificationModel.fromJson(e)).toList();
        final notificationReadModel = notificationUnRead
            .map((e) => NotificationModel.fromJson(e))
            .toList();
        final listNotification = [
          ...notificationUnreadModel,
          ...notificationReadModel
        ];
        listNotification
            .sort((a, b) => b.timecreated!.compareTo(a.timecreated!));
        listNotification.removeWhere((element) =>
            element.notification == 0 || element.notification == null);
        return listNotification;
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<int> getNotificationCount(String token, int userId) async {
    Uri url = Uri.https(
      Endpoints.baseUrl,
      Endpoints.rest,
      {
        'wstoken': token,
        'wsfunction': 'message_popup_get_popup_notifications',
        'moodlewsrestformat': 'json',
        'useridto': userId.toString(),
      }.map((key, value) => MapEntry(key, value.toString())),
    );

    final response = await client.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map;
      if (data['unreadcount'] == null) {
        return 0;
      }
      final notificationCount = data['unreadcount'] as int;
      return notificationCount;
    } else {
      throw ServerException();
    }
  }
}
