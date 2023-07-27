import 'gradeitem.dart';

class UserGradeModel {
  int? courseid;
  String? courseidnumber;
  int? userid;
  String? userfullname;
  String? useridnumber;
  int? maxdepth;
  List<Gradeitem>? gradeitems;

  UserGradeModel({
    this.courseid,
    this.courseidnumber,
    this.userid,
    this.userfullname,
    this.useridnumber,
    this.maxdepth,
    this.gradeitems,
  });

  @override
  String toString() {
    return 'UserGradeModel(courseid: $courseid, courseidnumber: $courseidnumber, userid: $userid, userfullname: $userfullname, useridnumber: $useridnumber, maxdepth: $maxdepth, gradeitems: $gradeitems)';
  }

  factory UserGradeModel.fromJson(Map<String, dynamic> json) => UserGradeModel(
        courseid: json['courseid'] as int?,
        courseidnumber: json['courseidnumber'] as String?,
        userid: json['userid'] as int?,
        userfullname: json['userfullname'] as String?,
        useridnumber: json['useridnumber'] as String?,
        maxdepth: json['maxdepth'] as int?,
        gradeitems: (json['gradeitems'] as List<dynamic>?)
            ?.map((e) => Gradeitem.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'courseid': courseid,
        'courseidnumber': courseidnumber,
        'userid': userid,
        'userfullname': userfullname,
        'useridnumber': useridnumber,
        'maxdepth': maxdepth,
        'gradeitems': gradeitems?.map((e) => e.toJson()).toList(),
      };
}
