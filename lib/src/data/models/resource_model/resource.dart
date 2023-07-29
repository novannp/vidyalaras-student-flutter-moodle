import 'contentfile.dart';

class ResourceModel {
  int? id;
  int? coursemodule;
  int? course;
  String? name;
  String? intro;
  int? introformat;
  List<dynamic>? introfiles;
  List<Contentfile>? contentfiles;
  int? tobemigrated;
  int? legacyfiles;
  dynamic legacyfileslast;
  int? display;
  String? displayoptions;
  int? filterfiles;
  int? revision;
  int? timemodified;
  int? section;
  int? visible;
  int? groupmode;
  int? groupingid;

  ResourceModel({
    this.id,
    this.coursemodule,
    this.course,
    this.name,
    this.intro,
    this.introformat,
    this.introfiles,
    this.contentfiles,
    this.tobemigrated,
    this.legacyfiles,
    this.legacyfileslast,
    this.display,
    this.displayoptions,
    this.filterfiles,
    this.revision,
    this.timemodified,
    this.section,
    this.visible,
    this.groupmode,
    this.groupingid,
  });

  @override
  String toString() {
    return 'ResourceModel(id: $id, coursemodule: $coursemodule, course: $course, name: $name, intro: $intro, introformat: $introformat, introfiles: $introfiles, contentfiles: $contentfiles, tobemigrated: $tobemigrated, legacyfiles: $legacyfiles, legacyfileslast: $legacyfileslast, display: $display, displayoptions: $displayoptions, filterfiles: $filterfiles, revision: $revision, timemodified: $timemodified, section: $section, visible: $visible, groupmode: $groupmode, groupingid: $groupingid)';
  }

  factory ResourceModel.fromJson(Map<String, dynamic> json) => ResourceModel(
        id: json['id'] as int?,
        coursemodule: json['coursemodule'] as int?,
        course: json['course'] as int?,
        name: json['name'] as String?,
        intro: json['intro'] as String?,
        introformat: json['introformat'] as int?,
        introfiles: json['introfiles'] as List<dynamic>?,
        contentfiles: (json['contentfiles'] as List<dynamic>?)
            ?.map((e) => Contentfile.fromJson(e as Map<String, dynamic>))
            .toList(),
        tobemigrated: json['tobemigrated'] as int?,
        legacyfiles: json['legacyfiles'] as int?,
        legacyfileslast: json['legacyfileslast'] as dynamic,
        display: json['display'] as int?,
        displayoptions: json['displayoptions'] as String?,
        filterfiles: json['filterfiles'] as int?,
        revision: json['revision'] as int?,
        timemodified: json['timemodified'] as int?,
        section: json['section'] as int?,
        visible: json['visible'] as int?,
        groupmode: json['groupmode'] as int?,
        groupingid: json['groupingid'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'coursemodule': coursemodule,
        'course': course,
        'name': name,
        'intro': intro,
        'introformat': introformat,
        'introfiles': introfiles,
        'contentfiles': contentfiles?.map((e) => e.toJson()).toList(),
        'tobemigrated': tobemigrated,
        'legacyfiles': legacyfiles,
        'legacyfileslast': legacyfileslast,
        'display': display,
        'displayoptions': displayoptions,
        'filterfiles': filterfiles,
        'revision': revision,
        'timemodified': timemodified,
        'section': section,
        'visible': visible,
        'groupmode': groupmode,
        'groupingid': groupingid,
      };
}
