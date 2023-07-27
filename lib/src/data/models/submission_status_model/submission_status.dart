import 'feedback.dart';
import 'lastattempt.dart';

class SubmissionStatus {
  Lastattempt? lastattempt;
  Feedback? feedback;
  List<dynamic>? warnings;

  SubmissionStatus({this.lastattempt, this.feedback, this.warnings});

  @override
  String toString() {
    return 'SubmissionStatus(lastattempt: $lastattempt, feedback: $feedback, warnings: $warnings)';
  }

  factory SubmissionStatus.fromJson(Map<String, dynamic> json) {
    return SubmissionStatus(
      lastattempt: json['lastattempt'] == null
          ? null
          : Lastattempt.fromJson(json['lastattempt'] as Map<String, dynamic>),
      feedback: json['feedback'] == null
          ? null
          : Feedback.fromJson(json['feedback'] as Map<String, dynamic>),
      warnings: json['warnings'] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toJson() => {
        'lastattempt': lastattempt?.toJson(),
        'feedback': feedback?.toJson(),
        'warnings': warnings,
      };
}
