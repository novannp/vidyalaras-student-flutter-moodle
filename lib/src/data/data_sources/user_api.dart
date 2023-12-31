import 'dart:convert';

import 'package:http/http.dart';
import 'package:lms_pptik/src/utils/exceptions.dart';

import '../../utils/endpoints.dart';
import '../models/user_model/user_model.dart';

abstract class UserApi {
  Future<UserModel> getUser(String useername, String token);
  Future<bool> updatePicture(String token, int itemId);
}

class UserApiImpl implements UserApi {
  final Client client;

  UserApiImpl(this.client);
  @override
  Future<UserModel> getUser(String username, String token) async {
    Uri url = Uri.https(Endpoints.baseUrl, Endpoints.rest, {
      'wstoken': token,
      'wsfunction': 'core_user_get_users_by_field',
      'moodlewsrestformat': 'json',
      'field': 'username',
      'values[]': username,
    });

    final response = await client.get(url);
    final result = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return UserModel.fromJson(result[0]);
    } else {
      throw NotFoundException('User tidak ditemukan');
    }
  }

  @override
  Future<bool> updatePicture(String token, int itemId) async {
    Uri url = Uri.https(
      Endpoints.baseUrl,
      Endpoints.rest,
      {
        'wstoken': token,
        'wsfunction': 'core_user_update_picture',
        'moodlewsrestformat': 'json',
        'draftitemid': itemId,
        'delete': 0,
      }.map((key, value) => MapEntry(key, value.toString())),
    );

    final response = await client.post(url);
    final result = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return result['success'];
    } else {
      throw Exception('Gagal update gambar');
    }
  }
}
