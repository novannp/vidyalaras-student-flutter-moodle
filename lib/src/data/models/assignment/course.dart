import 'assignment.dart';

class Course {
  int? id;
  String? fullname;
  String? shortname;
  int? timemodified;
  List<AssignmentModel>? assignments;

  Course({
    this.id,
    this.fullname,
    this.shortname,
    this.timemodified,
    this.assignments,
  });

  @override
  String toString() {
    return 'Course(id: $id, fullname: $fullname, shortname: $shortname, timemodified: $timemodified, assignments: $assignments)';
  }

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json['id'] as int?,
        fullname: json['fullname'] as String?,
        shortname: json['shortname'] as String?,
        timemodified: json['timemodified'] as int?,
        assignments: (json['assignments'] as List<dynamic>?)
            ?.map((e) => AssignmentModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullname': fullname,
        'shortname': shortname,
        'timemodified': timemodified,
        'assignments': assignments?.map((e) => e.toJson()).toList(),
      };
}
