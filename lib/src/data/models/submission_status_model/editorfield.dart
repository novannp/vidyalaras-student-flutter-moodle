class Editorfield {
  String? name;
  String? description;
  String? text;
  int? format;

  Editorfield({this.name, this.description, this.text, this.format});

  @override
  String toString() {
    return 'Editorfield(name: $name, description: $description, text: $text, format: $format)';
  }

  factory Editorfield.fromJson(Map<String, dynamic> json) => Editorfield(
        name: json['name'] as String?,
        description: json['description'] as String?,
        text: json['text'] as String?,
        format: json['format'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'text': text,
        'format': format,
      };
}
