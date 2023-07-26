class UserModel {
  final num? id;
  final String? name;
  final String? username;
  final String? email;
  final String? avatar;
  final String? city;
  final int? lastCourseAccess;
  final List<Role>? roles;
  final List<Group>? groups;

  UserModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.avatar,
    this.city,
    this.lastCourseAccess,
    this.roles,
    this.groups,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as num?,
      name: json['fullname'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      avatar: json['profileimageurl'] as String?,
      city: json['city'] as String?,
      lastCourseAccess: json['lastaccess'] as int?,
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => Role.fromJson(e as Map<String, dynamic>))
          .toList(),
      groups: json['groups'] != null
          ? (json['groups'] as List<dynamic>?)
              ?.map((e) => Group.fromJson(e as Map<String, dynamic>))
              .toList()
          : []);
}

class Role {
  final int roleid;
  final String name;
  final String shortname;

  Role(this.roleid, this.name, this.shortname);

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        json['roleid'] as int,
        json['name'] as String,
        json['shortname'] as String,
      );
}

class Group {
  final int? id;
  final String? name;

  Group(this.id, this.name);

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        json['id'] as int,
        json['name'] as String,
      );
}
