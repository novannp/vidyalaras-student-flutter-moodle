import 'package:intl/intl.dart';

extension IntExtension on int {
  DateTime toDateTime() {
    return DateTime.fromMillisecondsSinceEpoch(this * 1000);
  }

  String toDate() {
    return DateFormat('dd/MM/yyyy')
        .format(DateTime.fromMillisecondsSinceEpoch(this * 1000));
  }

  String toHoursString() {
    final format = DateFormat('HH:mm');
    final convert = DateTime.fromMillisecondsSinceEpoch(this * 1000);
    final formatted = format.format(convert);
    return formatted;
  }
}
