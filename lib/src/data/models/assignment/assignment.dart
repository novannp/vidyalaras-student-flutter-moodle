import 'config.dart';
import 'introattachment.dart';

class AssignmentModel {
  int? id;
  int? cmid;
  int? course;
  String? name;
  int? nosubmissions;
  int? submissiondrafts;
  int? sendnotifications;
  int? sendlatenotifications;
  int? sendstudentnotifications;
  int? duedate;
  int? allowsubmissionsfromdate;
  int? grade;
  int? timemodified;
  int? completionsubmit;
  int? cutoffdate;
  int? gradingduedate;
  int? teamsubmission;
  int? requireallteammemberssubmit;
  int? teamsubmissiongroupingid;
  int? blindmarking;
  int? hidegrader;
  int? revealidentities;
  String? attemptreopenmethod;
  int? maxattempts;
  int? markingworkflow;
  int? markingallocation;
  int? requiresubmissionstatement;
  int? preventsubmissionnotingroup;
  List<Config>? configs;
  String? intro;
  int? introformat;
  List<dynamic>? introfiles;
  List<Introattachment>? introattachments;

  AssignmentModel({
    this.id,
    this.cmid,
    this.course,
    this.name,
    this.nosubmissions,
    this.submissiondrafts,
    this.sendnotifications,
    this.sendlatenotifications,
    this.sendstudentnotifications,
    this.duedate,
    this.allowsubmissionsfromdate,
    this.grade,
    this.timemodified,
    this.completionsubmit,
    this.cutoffdate,
    this.gradingduedate,
    this.teamsubmission,
    this.requireallteammemberssubmit,
    this.teamsubmissiongroupingid,
    this.blindmarking,
    this.hidegrader,
    this.revealidentities,
    this.attemptreopenmethod,
    this.maxattempts,
    this.markingworkflow,
    this.markingallocation,
    this.requiresubmissionstatement,
    this.preventsubmissionnotingroup,
    this.configs,
    this.intro,
    this.introformat,
    this.introfiles,
    this.introattachments,
  });

  @override
  String toString() {
    return 'AssignmentModel(id: $id, cmid: $cmid, course: $course, name: $name, nosubmissions: $nosubmissions, submissiondrafts: $submissiondrafts, sendnotifications: $sendnotifications, sendlatenotifications: $sendlatenotifications, sendstudentnotifications: $sendstudentnotifications, duedate: $duedate, allowsubmissionsfromdate: $allowsubmissionsfromdate, grade: $grade, timemodified: $timemodified, completionsubmit: $completionsubmit, cutoffdate: $cutoffdate, gradingduedate: $gradingduedate, teamsubmission: $teamsubmission, requireallteammemberssubmit: $requireallteammemberssubmit, teamsubmissiongroupingid: $teamsubmissiongroupingid, blindmarking: $blindmarking, hidegrader: $hidegrader, revealidentities: $revealidentities, attemptreopenmethod: $attemptreopenmethod, maxattempts: $maxattempts, markingworkflow: $markingworkflow, markingallocation: $markingallocation, requiresubmissionstatement: $requiresubmissionstatement, preventsubmissionnotingroup: $preventsubmissionnotingroup, configs: $configs, intro: $intro, introformat: $introformat, introfiles: $introfiles, introattachments: $introattachments)';
  }

  factory AssignmentModel.fromJson(Map<String, dynamic> json) =>
      AssignmentModel(
        id: json['id'] as int?,
        cmid: json['cmid'] as int?,
        course: json['course'] as int?,
        name: json['name'] as String?,
        nosubmissions: json['nosubmissions'] as int?,
        submissiondrafts: json['submissiondrafts'] as int?,
        sendnotifications: json['sendnotifications'] as int?,
        sendlatenotifications: json['sendlatenotifications'] as int?,
        sendstudentnotifications: json['sendstudentnotifications'] as int?,
        duedate: json['duedate'] as int?,
        allowsubmissionsfromdate: json['allowsubmissionsfromdate'] as int?,
        grade: json['grade'] as int?,
        timemodified: json['timemodified'] as int?,
        completionsubmit: json['completionsubmit'] as int?,
        cutoffdate: json['cutoffdate'] as int?,
        gradingduedate: json['gradingduedate'] as int?,
        teamsubmission: json['teamsubmission'] as int?,
        requireallteammemberssubmit:
            json['requireallteammemberssubmit'] as int?,
        teamsubmissiongroupingid: json['teamsubmissiongroupingid'] as int?,
        blindmarking: json['blindmarking'] as int?,
        hidegrader: json['hidegrader'] as int?,
        revealidentities: json['revealidentities'] as int?,
        attemptreopenmethod: json['attemptreopenmethod'] as String?,
        maxattempts: json['maxattempts'] as int?,
        markingworkflow: json['markingworkflow'] as int?,
        markingallocation: json['markingallocation'] as int?,
        requiresubmissionstatement: json['requiresubmissionstatement'] as int?,
        preventsubmissionnotingroup:
            json['preventsubmissionnotingroup'] as int?,
        configs: (json['configs'] as List<dynamic>?)
            ?.map((e) => Config.fromJson(e as Map<String, dynamic>))
            .toList(),
        intro: json['intro'] as String?,
        introformat: json['introformat'] as int?,
        introfiles: json['introfiles'] as List<dynamic>?,
        introattachments: (json['introattachments'] as List<dynamic>?)
            ?.map((e) => Introattachment.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'cmid': cmid,
        'course': course,
        'name': name,
        'nosubmissions': nosubmissions,
        'submissiondrafts': submissiondrafts,
        'sendnotifications': sendnotifications,
        'sendlatenotifications': sendlatenotifications,
        'sendstudentnotifications': sendstudentnotifications,
        'duedate': duedate,
        'allowsubmissionsfromdate': allowsubmissionsfromdate,
        'grade': grade,
        'timemodified': timemodified,
        'completionsubmit': completionsubmit,
        'cutoffdate': cutoffdate,
        'gradingduedate': gradingduedate,
        'teamsubmission': teamsubmission,
        'requireallteammemberssubmit': requireallteammemberssubmit,
        'teamsubmissiongroupingid': teamsubmissiongroupingid,
        'blindmarking': blindmarking,
        'hidegrader': hidegrader,
        'revealidentities': revealidentities,
        'attemptreopenmethod': attemptreopenmethod,
        'maxattempts': maxattempts,
        'markingworkflow': markingworkflow,
        'markingallocation': markingallocation,
        'requiresubmissionstatement': requiresubmissionstatement,
        'preventsubmissionnotingroup': preventsubmissionnotingroup,
        'configs': configs?.map((e) => e.toJson()).toList(),
        'intro': intro,
        'introformat': introformat,
        'introfiles': introfiles,
        'introattachments': introattachments?.map((e) => e.toJson()).toList(),
      };
}
