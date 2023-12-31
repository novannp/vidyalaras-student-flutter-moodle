// import 'content.dart';

// class MateriModel {
//   final int? id;
//   final String? name;
//   final int? visible;
//   final String? summary;
//   final int? summaryformat;
//   final int? section;
//   final int? hiddenbynumsections;
//   final bool? uservisible;
//   final List<Modules>? modules;

//   MateriModel({
//     this.id,
//     this.name,
//     this.visible,
//     this.summary,
//     this.summaryformat,
//     this.section,
//     this.hiddenbynumsections,
//     this.uservisible,
//     this.modules,
//   });

//   MateriModel.fromJson(Map<String, dynamic> json)
//       : id = json['id'] as int?,
//         name = json['name'] as String?,
//         visible = json['visible'] as int?,
//         summary = json['summary'] as String?,
//         summaryformat = json['summaryformat'] as int?,
//         section = json['section'] as int?,
//         hiddenbynumsections = json['hiddenbynumsections'] as int?,
//         uservisible = json['uservisible'] as bool?,
//         modules = (json['modules'] as List?)
//             ?.map((dynamic e) => Modules.fromJson(e as Map<String, dynamic>))
//             .toList();
// }

// class Modules {
//   final int? id;
//   final String? url;
//   final String? name;
//   final int? instance;
//   final int? contextid;
//   final String? description;
//   final int? visible;
//   final bool? uservisible;
//   final int? visibleoncoursepage;
//   final String? modicon;
//   final String? modname;
//   final String? modplural;
//   final dynamic availability;
//   final String? availabilityinfo;
//   final int? indent;
//   final String? onclick;
//   final dynamic afterlink;
//   final String? customdata;
//   final bool? noviewlink;
//   final int? completion;
//   final Map<String, dynamic>? completiondata;
//   final List<DateModel>? dates;
//   final List<Content>? contents;

//   Modules(
//     this.completiondata, {
//     this.id,
//     this.url,
//     this.name,
//     this.instance,
//     this.contextid,
//     this.description,
//     this.visible,
//     this.uservisible,
//     this.visibleoncoursepage,
//     this.modicon,
//     this.modname,
//     this.modplural,
//     this.availability,
//     this.availabilityinfo,
//     this.indent,
//     this.onclick,
//     this.afterlink,
//     this.customdata,
//     this.noviewlink,
//     this.completion,
//     this.dates,
//     this.contents,
//   });

//   Modules.fromJson(Map<String, dynamic> json)
//       : id = json['id'] as int?,
//         url = json['url'] as String?,
//         name = json['name'] as String?,
//         instance = json['instance'] as int?,
//         contextid = json['contextid'] as int?,
//         description = json['description'] as String?,
//         visible = json['visible'] as int?,
//         uservisible = json['uservisible'] as bool?,
//         visibleoncoursepage = json['visibleoncoursepage'] as int?,
//         modicon = json['modicon'] as String?,
//         modname = json['modname'] as String?,
//         modplural = json['modplural'] as String?,
//         availability = json['availability'],
//         availabilityinfo = json['availabilityinfo'] as String?,
//         indent = json['indent'] as int?,
//         onclick = json['onclick'] as String?,
//         afterlink = json['afterlink'],
//         customdata = json['customdata'] as String?,
//         noviewlink = json['noviewlink'] as bool?,
//         completion = json['completion'] as int?,
//         completiondata = json['completiondata'] as Map<String, dynamic>?,
//         dates = (json['dates'] as List?)
//             ?.map((e) => DateModel.fromJson(e))
//             .toList(),
//         contents = (json['contents'] as List?)
//             ?.map((dynamic e) => Content.fromJson(e as Map<String, dynamic>))
//             .toList();
// }

// class DateModel {
//   final String? label;
//   final int? timestamp;

//   DateModel({
//     this.label,
//     this.timestamp,
//   });

//   DateModel.fromJson(Map<String, dynamic> json)
//       : label = json['label'] as String?,
//         timestamp = json['timestamp'] as int?;
// }
