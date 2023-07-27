class Filearea {
  String? area;
  List<dynamic>? files;

  Filearea({this.area, this.files});

  @override
  String toString() => 'Filearea(area: $area, files: $files)';

  factory Filearea.fromJson(Map<String, dynamic> json) => Filearea(
        area: json['area'] as String?,
        files: json['files'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'area': area,
        'files': files,
      };
}
