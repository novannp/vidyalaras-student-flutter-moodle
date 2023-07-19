import 'dart:convert';

import 'package:http/http.dart';
import 'package:lms_pptik/src/utils/exceptions.dart';

import '../../utils/endpoints.dart';
import '../models/badge_model.dart';

abstract class BadgeApi {
  Future<List<BadgeModel>> getBadge(String token);
  Future<String> getBadgeImage(String token, BadgeModel badge);
}

class BadgeApiImpl implements BadgeApi {
  final Client client;

  BadgeApiImpl(this.client);

  @override
  Future<List<BadgeModel>> getBadge(String token) async {
    final url = Uri.https(Endpoints.baseUrl, Endpoints.rest, {
      'wstoken': token,
      'wsfunction': 'core_badges_get_user_badges',
      'moodlewsrestformat': 'json',
    });
    final response = await client.get(url);
    if (response.statusCode == 200) {
      if (response.body.isEmpty) {
        return <BadgeModel>[];
      }
      final result = jsonDecode(response.body)['badges'];

      return result.map<BadgeModel>((e) => BadgeModel.fromJson(e)).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<String> getBadgeImage(String token, BadgeModel badge) async {
    return ("${badge.badgeurl}?token=$token");
  }
}
