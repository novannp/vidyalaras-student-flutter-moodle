class Grade {
  int? id;
  int? assignment;
  int? userid;
  int? attemptnumber;
  int? timecreated;
  int? timemodified;
  int? grader;
  String? grade;

  Grade({
    this.id,
    this.assignment,
    this.userid,
    this.attemptnumber,
    this.timecreated,
    this.timemodified,
    this.grader,
    this.grade,
  });

  @override
  String toString() {
    return 'Grade(id: $id, assignment: $assignment, userid: $userid, attemptnumber: $attemptnumber, timecreated: $timecreated, timemodified: $timemodified, grader: $grader, grade: $grade)';
  }

  factory Grade.fromJson(Map<String, dynamic> json) => Grade(
        id: json['id'] as int?,
        assignment: json['assignment'] as int?,
        userid: json['userid'] as int?,
        attemptnumber: json['attemptnumber'] as int?,
        timecreated: json['timecreated'] as int?,
        timemodified: json['timemodified'] as int?,
        grader: json['grader'] as int?,
        grade: json['grade'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'assignment': assignment,
        'userid': userid,
        'attemptnumber': attemptnumber,
        'timecreated': timecreated,
        'timemodified': timemodified,
        'grader': grader,
        'grade': grade,
      };
}
