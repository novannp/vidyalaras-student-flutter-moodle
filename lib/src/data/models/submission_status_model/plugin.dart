import 'editorfield.dart';
import 'filearea.dart';

class Plugin {
  String? type;
  String? name;
  List<Filearea>? fileareas;
  List<Editorfield>? editorfields;

  Plugin({this.type, this.name, this.fileareas, this.editorfields});

  @override
  String toString() {
    return 'Plugin(type: $type, name: $name, fileareas: $fileareas, editorfields: $editorfields)';
  }

  factory Plugin.fromJson(Map<String, dynamic> json) => Plugin(
        type: json['type'] as String?,
        name: json['name'] as String?,
        fileareas: (json['fileareas'] as List<dynamic>?)
            ?.map((e) => Filearea.fromJson(e as Map<String, dynamic>))
            .toList(),
        editorfields: (json['editorfields'] as List<dynamic>?)
            ?.map((e) => Editorfield.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'name': name,
        'fileareas': fileareas?.map((e) => e.toJson()).toList(),
        'editorfields': editorfields?.map((e) => e.toJson()).toList(),
      };
}
