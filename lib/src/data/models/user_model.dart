class UserModel {
  final num? id;
  final String? name;
  final String? username;
  final String? email;
  final String? avatar;
  final String? city;
  final int? lastCourseAccess;

  UserModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.avatar,
    this.city,
    this.lastCourseAccess,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] as num?,
        name: json['fullname'] as String?,
        username: json['username'] as String?,
        email: json['email'] as String?,
        avatar: json['profileimageurl'] as String?,
        city: json['city'] as String?,
        lastCourseAccess: json['lastaccess'] as int?,
      );
}
