import 'plugin.dart';

class Submission {
  int? id;
  int? userid;
  int? attemptnumber;
  int? timecreated;
  int? timemodified;
  String? status;
  int? groupid;
  int? assignment;
  int? latest;
  List<Plugin>? plugins;

  Submission({
    this.id,
    this.userid,
    this.attemptnumber,
    this.timecreated,
    this.timemodified,
    this.status,
    this.groupid,
    this.assignment,
    this.latest,
    this.plugins,
  });

  @override
  String toString() {
    return 'Submission(id: $id, userid: $userid, attemptnumber: $attemptnumber, timecreated: $timecreated, timemodified: $timemodified, status: $status, groupid: $groupid, assignment: $assignment, latest: $latest, plugins: $plugins)';
  }

  factory Submission.fromJson(Map<String, dynamic> json) => Submission(
        id: json['id'] as int?,
        userid: json['userid'] as int?,
        attemptnumber: json['attemptnumber'] as int?,
        timecreated: json['timecreated'] as int?,
        timemodified: json['timemodified'] as int?,
        status: json['status'] as String?,
        groupid: json['groupid'] as int?,
        assignment: json['assignment'] as int?,
        latest: json['latest'] as int?,
        plugins: (json['plugins'] as List<dynamic>?)
            ?.map((e) => Plugin.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'userid': userid,
        'attemptnumber': attemptnumber,
        'timecreated': timecreated,
        'timemodified': timemodified,
        'status': status,
        'groupid': groupid,
        'assignment': assignment,
        'latest': latest,
        'plugins': plugins?.map((e) => e.toJson()).toList(),
      };
}
