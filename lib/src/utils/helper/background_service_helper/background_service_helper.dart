import 'dart:developer';
import 'dart:ui';
import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lms_pptik/injection.dart' as di;
import 'package:lms_pptik/src/data/data_sources/quote_api.dart';
import 'package:lms_pptik/src/utils/helper/notification_plugin/notification_plugin.dart';
import 'package:lms_pptik/src/utils/helper/secure_storage/secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

final ReceivePort port = ReceivePort();

class BackgroundServiceHelper {
  static BackgroundServiceHelper? _instance;

  static const String _isolateName = 'isolate';
  static SendPort? _uiSendPort;

  BackgroundServiceHelper._internal() {
    _instance = this;
  }

  factory BackgroundServiceHelper() =>
      _instance ?? BackgroundServiceHelper._internal();

  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(port.sendPort, _isolateName);
  }

  @pragma('vm:entry-point')
  static void callback() async {
    final prefs = await SharedPreferences.getInstance();

    log('THIS IS FROM CALLBACK');
    final tag = prefs.getString('tag');
    final result = await QuoteApiImpl().getQuoteByTag(tag!);

    final NotificationPlugin notificationService = NotificationPlugin();
    await notificationService.showQuoteNotification(result);

    // Send a message to the main isolate to signal task completion
    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}
