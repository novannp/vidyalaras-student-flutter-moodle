import 'submission.dart';

class Lastattempt {
  Submission? submission;
  List<dynamic>? submissiongroupmemberswhoneedtosubmit;
  bool? submissionsenabled;
  bool? locked;
  bool? graded;
  bool? canedit;
  bool? caneditowner;
  bool? cansubmit;
  int? extensionduedate;
  bool? blindmarking;
  String? gradingstatus;
  List<int>? usergroups;

  Lastattempt({
    this.submission,
    this.submissiongroupmemberswhoneedtosubmit,
    this.submissionsenabled,
    this.locked,
    this.graded,
    this.canedit,
    this.caneditowner,
    this.cansubmit,
    this.extensionduedate,
    this.blindmarking,
    this.gradingstatus,
    this.usergroups,
  });

  @override
  String toString() {
    return 'Lastattempt(submission: $submission, submissiongroupmemberswhoneedtosubmit: $submissiongroupmemberswhoneedtosubmit, submissionsenabled: $submissionsenabled, locked: $locked, graded: $graded, canedit: $canedit, caneditowner: $caneditowner, cansubmit: $cansubmit, extensionduedate: $extensionduedate, blindmarking: $blindmarking, gradingstatus: $gradingstatus, usergroups: $usergroups)';
  }

  factory Lastattempt.fromJson(Map<String, dynamic> json) => Lastattempt(
        submission: json['submission'] == null
            ? null
            : Submission.fromJson(json['submission'] as Map<String, dynamic>),
        submissiongroupmemberswhoneedtosubmit:
            json['submissiongroupmemberswhoneedtosubmit'] as List<dynamic>?,
        submissionsenabled: json['submissionsenabled'] as bool?,
        locked: json['locked'] as bool?,
        graded: json['graded'] as bool?,
        canedit: json['canedit'] as bool?,
        caneditowner: json['caneditowner'] as bool?,
        cansubmit: json['cansubmit'] as bool?,
        extensionduedate: json['extensionduedate'] as int?,
        blindmarking: json['blindmarking'] as bool?,
        gradingstatus: json['gradingstatus'] as String?,
        usergroups: json['usergroups'] as List<int>?,
      );

  Map<String, dynamic> toJson() => {
        'submission': submission?.toJson(),
        'submissiongroupmemberswhoneedtosubmit':
            submissiongroupmemberswhoneedtosubmit,
        'submissionsenabled': submissionsenabled,
        'locked': locked,
        'graded': graded,
        'canedit': canedit,
        'caneditowner': caneditowner,
        'cansubmit': cansubmit,
        'extensionduedate': extensionduedate,
        'blindmarking': blindmarking,
        'gradingstatus': gradingstatus,
        'usergroups': usergroups,
      };
}
