// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int?,
      username: json['username'] as String?,
      fullname: json['fullname'] as String?,
      email: json['email'] as String?,
      department: json['department'] as String?,
      firstaccess: json['firstaccess'] as int?,
      lastaccess: json['lastaccess'] as int?,
      auth: json['auth'] as String?,
      suspended: json['suspended'] as bool?,
      confirmed: json['confirmed'] as bool?,
      lang: json['lang'] as String?,
      theme: json['theme'] as String?,
      timezone: json['timezone'] as String?,
      mailformat: json['mailformat'] as int?,
      description: json['description'] as String?,
      descriptionformat: json['descriptionformat'] as int?,
      country: json['country'] as String?,
      profileimageurlsmall: json['profileimageurlsmall'] as String?,
      profileimageurl: json['profileimageurl'] as String?,
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => Role.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'fullname': instance.fullname,
      'email': instance.email,
      'department': instance.department,
      'firstaccess': instance.firstaccess,
      'lastaccess': instance.lastaccess,
      'auth': instance.auth,
      'suspended': instance.suspended,
      'confirmed': instance.confirmed,
      'lang': instance.lang,
      'theme': instance.theme,
      'timezone': instance.timezone,
      'mailformat': instance.mailformat,
      'description': instance.description,
      'descriptionformat': instance.descriptionformat,
      'country': instance.country,
      'profileimageurlsmall': instance.profileimageurlsmall,
      'profileimageurl': instance.profileimageurl,
      'roles': instance.roles,
    };
