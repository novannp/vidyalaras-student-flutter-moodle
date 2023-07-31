import 'rulevalue.dart';

class Detail {
  String? rulename;
  Rulevalue? rulevalue;

  Detail({this.rulename, this.rulevalue});

  @override
  String toString() => 'Detail(rulename: $rulename, rulevalue: $rulevalue)';

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        rulename: json['rulename'] as String?,
        rulevalue: json['rulevalue'] == null
            ? null
            : Rulevalue.fromJson(json['rulevalue'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'rulename': rulename,
        'rulevalue': rulevalue?.toJson(),
      };
}
