class ContentModel {
  String? type;
  String? filename;
  String? filepath;
  int? filesize;
  String? fileurl;
  int? timecreated;
  int? timemodified;
  int? sortorder;
  String? mimetype;
  bool? isexternalfile;
  int? userid;
  String? author;
  String? license;

  ContentModel({
    this.type,
    this.filename,
    this.filepath,
    this.filesize,
    this.fileurl,
    this.timecreated,
    this.timemodified,
    this.sortorder,
    this.mimetype,
    this.isexternalfile,
    this.userid,
    this.author,
    this.license,
  });

  @override
  String toString() {
    return 'ContentModel(type: $type, filename: $filename, filepath: $filepath, filesize: $filesize, fileurl: $fileurl, timecreated: $timecreated, timemodified: $timemodified, sortorder: $sortorder, mimetype: $mimetype, isexternalfile: $isexternalfile, userid: $userid, author: $author, license: $license)';
  }

  factory ContentModel.fromJson(Map<String, dynamic> json) => ContentModel(
        type: json['type'] as String?,
        filename: json['filename'] as String?,
        filepath: json['filepath'] as String?,
        filesize: json['filesize'] as int?,
        fileurl: json['fileurl'] as String?,
        timecreated: json['timecreated'] as int?,
        timemodified: json['timemodified'] as int?,
        sortorder: json['sortorder'] as int?,
        mimetype: json['mimetype'] as String?,
        isexternalfile: json['isexternalfile'] as bool?,
        userid: json['userid'] as int?,
        author: json['author'] as String?,
        license: json['license'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'filename': filename,
        'filepath': filepath,
        'filesize': filesize,
        'fileurl': fileurl,
        'timecreated': timecreated,
        'timemodified': timemodified,
        'sortorder': sortorder,
        'mimetype': mimetype,
        'isexternalfile': isexternalfile,
        'userid': userid,
        'author': author,
        'license': license,
      };
}
