class Introattachment {
  String? filename;
  String? filepath;
  int? filesize;
  String? fileurl;
  int? timemodified;
  String? mimetype;
  bool? isexternalfile;

  Introattachment({
    this.filename,
    this.filepath,
    this.filesize,
    this.fileurl,
    this.timemodified,
    this.mimetype,
    this.isexternalfile,
  });

  @override
  String toString() {
    return 'Introattachment(filename: $filename, filepath: $filepath, filesize: $filesize, fileurl: $fileurl, timemodified: $timemodified, mimetype: $mimetype, isexternalfile: $isexternalfile)';
  }

  factory Introattachment.fromJson(Map<String, dynamic> json) {
    return Introattachment(
      filename: json['filename'] as String?,
      filepath: json['filepath'] as String?,
      filesize: json['filesize'] as int?,
      fileurl: json['fileurl'] as String?,
      timemodified: json['timemodified'] as int?,
      mimetype: json['mimetype'] as String?,
      isexternalfile: json['isexternalfile'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'filename': filename,
        'filepath': filepath,
        'filesize': filesize,
        'fileurl': fileurl,
        'timemodified': timemodified,
        'mimetype': mimetype,
        'isexternalfile': isexternalfile,
      };
}
