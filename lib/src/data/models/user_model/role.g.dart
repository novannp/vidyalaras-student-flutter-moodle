// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Role _$RoleFromJson(Map<String, dynamic> json) => Role(
      json['roleid'] as int?,
      json['name'] as String?,
      json['shortname'] as String,
    );

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
      'roleid': instance.roleid,
      'name': instance.name,
      'shortname': instance.shortname,
    };
