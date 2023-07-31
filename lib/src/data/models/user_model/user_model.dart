import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lms_pptik/src/data/models/user_model/role.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  int? id;
  String? username;
  String? fullname;
  String? email;
  String? department;
  int? firstaccess;
  int? lastaccess;
  String? auth;
  bool? suspended;
  bool? confirmed;
  String? lang;
  String? theme;
  String? timezone;
  int? mailformat;
  String? description;
  int? descriptionformat;
  String? country;
  String? profileimageurlsmall;
  String? profileimageurl;
  List<Role>? roles;

  UserModel({
    this.id,
    this.username,
    this.fullname,
    this.email,
    this.department,
    this.firstaccess,
    this.lastaccess,
    this.auth,
    this.suspended,
    this.confirmed,
    this.lang,
    this.theme,
    this.timezone,
    this.mailformat,
    this.description,
    this.descriptionformat,
    this.country,
    this.profileimageurlsmall,
    this.profileimageurl,
    this.roles,
  });

  @override
  String toString() {
    return 'UserModel(id: $id, username: $username, fullname: $fullname, email: $email, department: $department, firstaccess: $firstaccess, lastaccess: $lastaccess, auth: $auth, suspended: $suspended, confirmed: $confirmed, lang: $lang, theme: $theme, timezone: $timezone, mailformat: $mailformat, description: $description, descriptionformat: $descriptionformat, country: $country, profileimageurlsmall: $profileimageurlsmall, profileimageurl: $profileimageurl, ';
  }

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
