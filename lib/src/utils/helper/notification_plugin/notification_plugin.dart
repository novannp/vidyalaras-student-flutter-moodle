import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationPlugin {
  static final NotificationPlugin _notificationPlugin =
      NotificationPlugin._internal();

  factory NotificationPlugin() {
    return _notificationPlugin;
  }

  NotificationPlugin._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void showWelcomeNotification(String name) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      '17',
      'Welcome',
      category: AndroidNotificationCategory.event,
      importance: Importance.high,
      priority: Priority.high,
      sound: RawResourceAndroidNotificationSound('welcome'),
    );
    await flutterLocalNotificationsPlugin.show(
      0,
      'Hallo! $name',
      'Selamat datang di LMS PPTIK',
      const NotificationDetails(android: androidNotificationDetails),
    );
  }

  Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<void> cancelAllNotification() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
