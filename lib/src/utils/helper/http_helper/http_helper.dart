import 'package:http/http.dart';

class HttpHelper {
  static Client? _client;

  static Client get client => _client ?? Client();
}
