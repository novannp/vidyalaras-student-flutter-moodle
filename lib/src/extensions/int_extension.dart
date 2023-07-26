import 'package:intl/intl.dart';

extension IntExtension on int {
  DateTime toDateTime() {
    return DateTime.fromMillisecondsSinceEpoch(this * 1000);
  }

  String toDate() {
    return DateFormat('dd/MM/yyyy')
        .format(DateTime.fromMillisecondsSinceEpoch(this * 1000));
  }

  String toDateAndTime() {
    return DateFormat('dd/MM/yyyy HH:mm')
        .format(DateTime.fromMillisecondsSinceEpoch(this * 1000));
  }

  String toHoursString() {
    final format = DateFormat('HH:mm');
    final convert = DateTime.fromMillisecondsSinceEpoch(this * 1000);
    final formatted = format.format(convert);
    return formatted;
  }

  String formatFileSize() {
    if (this < 1024) {
      return '$this B';
    } else if (this < 1024 * 1024) {
      double kbSize = this / 1024;
      return '${kbSize.toStringAsFixed(2)} KB';
    } else if (this < 1024 * 1024 * 1024) {
      double mbSize = this / (1024 * 1024);
      return '${mbSize.toStringAsFixed(2)} MB';
    } else {
      double gbSize = this / (1024 * 1024 * 1024);
      return '${gbSize.toStringAsFixed(2)} GB';
    }
  }
}
