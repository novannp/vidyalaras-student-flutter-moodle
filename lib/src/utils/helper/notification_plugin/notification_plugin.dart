import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:open_file/open_file.dart';

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
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        if (details.id == 21) {
          OpenFile.open(details.payload);
        }
      },
    );
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
      onlyAlertOnce: true,
    );
    await flutterLocalNotificationsPlugin.show(
      0,
      'Hallo! $name',
      'Selamat datang di LMS PPTIK',
      const NotificationDetails(android: androidNotificationDetails),
    );
  }

  void showDownloadProgressNotification(String fileName, int progress) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      '20',
      'Download',
      visibility: NotificationVisibility.public,
      category: AndroidNotificationCategory.progress,
      progress: progress,
      maxProgress: 100,
      showProgress: true,
      channelShowBadge: false,
      importance: Importance.max,
      priority: Priority.high,
      onlyAlertOnce: true,
    );
    await flutterLocalNotificationsPlugin.show(
      20,
      fileName,
      'Downloading..',
      NotificationDetails(
        android: androidNotificationDetails,
      ),
    );
  }

  Future<void> downloadCompleted(String path) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
      '21',
      'Download',
      visibility: NotificationVisibility.public,
      category: AndroidNotificationCategory.progress,
      channelShowBadge: false,
      importance: Importance.max,
      priority: Priority.high,
      onlyAlertOnce: true,
    );
    await flutterLocalNotificationsPlugin.show(
      21,
      'Download Selesai',
      path,
      NotificationDetails(
        android: androidNotificationDetails,
      ),
      payload: path,
    );
  }

  Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<void> cancelAllNotification() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
