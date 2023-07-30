import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:lms_pptik/injection.dart' as di;

import '../notification_plugin/notification_plugin.dart';
import '../secure_storage/secure_storage.dart';

class FunctionHelper {
  static void downloadFileHandler(
      BuildContext context, String fileName, String fileUrl) async {
    final notif = di.locator<NotificationPlugin>();
    final storage = di.locator<StorageHelper>();
    final token = await storage.read('token');
    final url = '$fileUrl?token=$token';
    FileDownloader.downloadFile(
        url: url,
        name: fileName,
        onProgress: (fileName, progress) async {
          notif.showDownloadProgressNotification(
            fileName!,
            progress.toInt(),
          );
        },
        onDownloadCompleted: (path) {
          notif.cancelNotification(20);
          notif.downloadCompleted(path);
        },
        onDownloadError: (error) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Download error: $error')));
        }).then((file) {
      debugPrint('file path: ${file?.path}');
    });
  }

  static isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}
