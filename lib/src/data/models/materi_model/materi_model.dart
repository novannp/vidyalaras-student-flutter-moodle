import 'module.dart';

class MateriModel {
  int? id;
  String? name;
  int? visible;
  String? summary;
  int? summaryformat;
  int? section;
  int? hiddenbynumsections;
  bool? uservisible;
  List<Module>? modules;

  MateriModel({
    this.id,
    this.name,
    this.visible,
    this.summary,
    this.summaryformat,
    this.section,
    this.hiddenbynumsections,
    this.uservisible,
    this.modules,
  });

  @override
  String toString() {
    return 'MateriModel(id: $id, name: $name, visible: $visible, summary: $summary, summaryformat: $summaryformat, section: $section, hiddenbynumsections: $hiddenbynumsections, uservisible: $uservisible, modules: $modules)';
  }

  factory MateriModel.fromJson(Map<String, dynamic> json) => MateriModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        visible: json['visible'] as int?,
        summary: json['summary'] as String?,
        summaryformat: json['summaryformat'] as int?,
        section: json['section'] as int?,
        hiddenbynumsections: json['hiddenbynumsections'] as int?,
        uservisible: json['uservisible'] as bool?,
        modules: (json['modules'] as List<dynamic>?)
            ?.map((e) => Module.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'visible': visible,
        'summary': summary,
        'summaryformat': summaryformat,
        'section': section,
        'hiddenbynumsections': hiddenbynumsections,
        'uservisible': uservisible,
        'modules': modules?.map((e) => e.toJson()).toList(),
      };
}
