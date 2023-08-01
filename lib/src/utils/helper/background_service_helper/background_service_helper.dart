import 'dart:ui';
import 'dart:isolate';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:lms_pptik/src/data/data_sources/quote_api.dart';
import 'package:lms_pptik/src/presentation/blocs/quote_setting/quote_setting_cubit.dart';
import 'package:lms_pptik/src/utils/helper/notification_plugin/notification_plugin.dart';
import 'package:lms_pptik/src/utils/helper/secure_storage/secure_storage.dart';
import 'package:path_provider/path_provider.dart';

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
    final storage = StorageHelper();
    final isEnable = await storage.read('isEnable');
    final tag = await storage.read('tag');
    final NotificationPlugin notificationService = NotificationPlugin();
    if (isEnable == "true" || isEnable == true) {
      var result = await QuoteApiImpl().getQuoteByTag(tag);
      await notificationService.showQuoteNotification(result);
    }

    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}
