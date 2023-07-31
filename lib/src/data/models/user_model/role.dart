import 'package:freezed_annotation/freezed_annotation.dart';

part 'role.g.dart';

@JsonSerializable()
class Role {
  final int? roleid;
  final String? name;
  final String shortname;

  Role(this.roleid, this.name, this.shortname);

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);
  Map<String, dynamic> toJson() => _$RoleToJson(this);
}
