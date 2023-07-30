import 'completiondata.dart';
import 'content.dart';
import 'date_model.dart';

class Module {
  int? id;
  String? url;
  String? name;
  int? instance;
  int? contextid;
  List<ContentModel>? contents;
  String? description;
  int? visible;
  bool? uservisible;
  String? availabilityinfo;
  int? visibleoncoursepage;
  String? modicon;
  String? modname;
  String? modplural;
  int? indent;
  String? onclick;
  dynamic afterlink;
  String? customdata;
  bool? noviewlink;
  int? completion;
  Completiondata? completiondata;
  List<DateModel>? dates;

  Module({
    this.id,
    this.url,
    this.name,
    this.instance,
    this.contextid,
    this.contents,
    this.description,
    this.visible,
    this.uservisible,
    this.availabilityinfo,
    this.visibleoncoursepage,
    this.modicon,
    this.modname,
    this.modplural,
    this.indent,
    this.onclick,
    this.afterlink,
    this.customdata,
    this.noviewlink,
    this.completion,
    this.completiondata,
    this.dates,
  });

  @override
  String toString() {
    return 'Module(id: $id, url: $url, name: $name, instance: $instance, contextid: $contextid, visible: $visible, uservisible: $uservisible, visibleoncoursepage: $visibleoncoursepage, modicon: $modicon, modname: $modname, modplural: $modplural, indent: $indent, onclick: $onclick, afterlink: $afterlink, customdata: $customdata, noviewlink: $noviewlink, completion: $completion, dates: $dates)';
  }

  factory Module.fromJson(Map<String, dynamic> json) => Module(
        id: json['id'] as int?,
        url: json['url'] as String?,
        name: json['name'] as String?,
        instance: json['instance'] as int?,
        contextid: json['contextid'] as int?,
        contents: (json['contents'] as List<dynamic>?)
            ?.map((e) => ContentModel.fromJson(e))
            .toList(),
        description: json['description'] as String?,
        availabilityinfo: json['availabilityinfo'] as String?,
        visible: json['visible'] as int?,
        uservisible: json['uservisible'] as bool?,
        visibleoncoursepage: json['visibleoncoursepage'] as int?,
        modicon: json['modicon'] as String?,
        modname: json['modname'] as String?,
        modplural: json['modplural'] as String?,
        indent: json['indent'] as int?,
        onclick: json['onclick'] as String?,
        afterlink: json['afterlink'] as dynamic,
        customdata: json['customdata'] as String?,
        noviewlink: json['noviewlink'] as bool?,
        completion: json['completion'] as int?,
        completiondata: json['completiondata'] == null
            ? null
            : Completiondata.fromJson(
                json['completiondata'] as Map<String, dynamic>),
        dates: (json['dates'] as List<dynamic>?)
            ?.map((e) => DateModel.fromJson(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'url': url,
        'name': name,
        'instance': instance,
        'contextid': contextid,
        'visible': visible,
        'uservisible': uservisible,
        'visibleoncoursepage': visibleoncoursepage,
        'modicon': modicon,
        'modname': modname,
        'modplural': modplural,
        'indent': indent,
        'onclick': onclick,
        'afterlink': afterlink,
        'customdata': customdata,
        'noviewlink': noviewlink,
        'completion': completion,
        'dates': dates,
      };
}
