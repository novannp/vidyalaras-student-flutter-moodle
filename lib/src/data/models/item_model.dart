class ItemModel {
  String? component;
  int? contextid;
  String? userid;
  String? filearea;
  String? filename;
  String? filepath;
  int? itemid;
  String? license;
  String? author;
  String? source;

  ItemModel({
    this.component,
    this.contextid,
    this.userid,
    this.filearea,
    this.filename,
    this.filepath,
    this.itemid,
    this.license,
    this.author,
    this.source,
  });

  @override
  String toString() {
    return 'ItemModel(component: $component, contextid: $contextid, userid: $userid, filearea: $filearea, filename: $filename, filepath: $filepath, itemid: $itemid, license: $license, author: $author, source: $source)';
  }

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        component: json['component'] as String?,
        contextid: json['contextid'] as int?,
        userid: json['userid'] as String?,
        filearea: json['filearea'] as String?,
        filename: json['filename'] as String?,
        filepath: json['filepath'] as String?,
        itemid: json['itemid'] as int?,
        license: json['license'] as String?,
        author: json['author'] as String?,
        source: json['source'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'component': component,
        'contextid': contextid,
        'userid': userid,
        'filearea': filearea,
        'filename': filename,
        'filepath': filepath,
        'itemid': itemid,
        'license': license,
        'author': author,
        'source': source,
      };
}
