import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:lms_pptik/src/utils/exceptions.dart';

import '../../utils/endpoints.dart';

abstract class AuthApi {
  Future<String> login(String username, String password);
  Future<void> logout();
}

class AuthApiImpl implements AuthApi {
  final Client client;

  AuthApiImpl(this.client);
  @override
  Future<String> login(String username, String password) async {
    Uri url = Uri.https(Endpoints.baseUrl, Endpoints.login, {
      'service': 'moodle_mobile_app',
      'username': username.replaceAll(' ', ''),
      'password': password,
    });

    final response = await client.post(url);
    log("LOGIN : ${response.statusCode}");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      inspect(data);
      if (data['token'] != null) {
        return data['token'] as String;
      } else if (data['errorcode'] == 'invalidlogin') {
        throw AuthException('Username atau password salah');
      } else {
        throw AuthException('Terjadi kesalahan');
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<String> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
