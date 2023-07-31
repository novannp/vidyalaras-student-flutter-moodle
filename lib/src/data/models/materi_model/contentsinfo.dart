class Contentsinfo {
  int? filescount;
  int? filessize;
  int? lastmodified;
  List<String>? mimetypes;
  String? repositorytype;

  Contentsinfo({
    this.filescount,
    this.filessize,
    this.lastmodified,
    this.mimetypes,
    this.repositorytype,
  });

  @override
  String toString() {
    return 'Contentsinfo(filescount: $filescount, filessize: $filessize, lastmodified: $lastmodified, mimetypes: $mimetypes, repositorytype: $repositorytype)';
  }

  factory Contentsinfo.fromJson(Map<String, dynamic> json) => Contentsinfo(
        filescount: json['filescount'] as int?,
        filessize: json['filessize'] as int?,
        lastmodified: json['lastmodified'] as int?,
        mimetypes: json['mimetypes'] as List<String>?,
        repositorytype: json['repositorytype'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'filescount': filescount,
        'filessize': filessize,
        'lastmodified': lastmodified,
        'mimetypes': mimetypes,
        'repositorytype': repositorytype,
      };
}
