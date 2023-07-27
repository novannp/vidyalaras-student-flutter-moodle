import 'grade.dart';
import 'plugin.dart';

class Feedback {
  Grade? grade;
  String? gradefordisplay;
  int? gradeddate;
  List<Plugin>? plugins;

  Feedback({
    this.grade,
    this.gradefordisplay,
    this.gradeddate,
    this.plugins,
  });

  @override
  String toString() {
    return 'Feedback(grade: $grade, gradefordisplay: $gradefordisplay, gradeddate: $gradeddate, plugins: $plugins)';
  }

  factory Feedback.fromJson(Map<String, dynamic> json) => Feedback(
        grade: json['grade'] == null
            ? null
            : Grade.fromJson(json['grade'] as Map<String, dynamic>),
        gradefordisplay: json['gradefordisplay'] as String?,
        gradeddate: json['gradeddate'] as int?,
        plugins: (json['plugins'] as List<dynamic>?)
            ?.map((e) => Plugin.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'grade': grade?.toJson(),
        'gradefordisplay': gradefordisplay,
        'gradeddate': gradeddate,
        'plugins': plugins?.map((e) => e.toJson()).toList(),
      };
}
