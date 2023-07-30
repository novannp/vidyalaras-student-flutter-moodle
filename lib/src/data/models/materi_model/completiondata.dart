import 'detail.dart';

class Completiondata {
  int? state;
  int? timecompleted;
  dynamic overrideby;
  bool? valueused;
  bool? hascompletion;
  bool? isautomatic;
  bool? istrackeduser;
  bool? uservisible;
  List<Detail>? details;

  Completiondata({
    this.state,
    this.timecompleted,
    this.overrideby,
    this.valueused,
    this.hascompletion,
    this.isautomatic,
    this.istrackeduser,
    this.uservisible,
    this.details,
  });

  @override
  String toString() {
    return 'Completiondata(state: $state, timecompleted: $timecompleted, overrideby: $overrideby, valueused: $valueused, hascompletion: $hascompletion, isautomatic: $isautomatic, istrackeduser: $istrackeduser, uservisible: $uservisible, details: $details)';
  }

  factory Completiondata.fromJson(Map<String, dynamic> json) {
    return Completiondata(
      state: json['state'] as int?,
      timecompleted: json['timecompleted'] as int?,
      overrideby: json['overrideby'] as dynamic,
      valueused: json['valueused'] as bool?,
      hascompletion: json['hascompletion'] as bool?,
      isautomatic: json['isautomatic'] as bool?,
      istrackeduser: json['istrackeduser'] as bool?,
      uservisible: json['uservisible'] as bool?,
      details: (json['details'] as List<dynamic>?)
          ?.map((e) => Detail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'state': state,
        'timecompleted': timecompleted,
        'overrideby': overrideby,
        'valueused': valueused,
        'hascompletion': hascompletion,
        'isautomatic': isautomatic,
        'istrackeduser': istrackeduser,
        'uservisible': uservisible,
        'details': details?.map((e) => e.toJson()).toList(),
      };
}
