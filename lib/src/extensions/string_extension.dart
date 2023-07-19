import 'package:html_unescape/html_unescape_small.dart';
import 'package:intl/intl.dart';

extension StringExtensions on String {
  String decodeHtml() {
    final HtmlUnescape htmlUnescape = HtmlUnescape();
    final decodeSring = htmlUnescape.convert(this);
    return decodeSring;
  }

  String formatDate() {
    final format = DateFormat("dd MMMM yyyy, HH:mm");
    final formattedDate = format.format(DateTime.parse(this));
    return formattedDate;
  }
}
