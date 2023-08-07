class PageLesson {
  Page? page;
  List<int>? answerids;
  List<int>? jumps;
  int? filescount;
  int? filessizetotal;

  PageLesson(
      {this.page,
        this.answerids,
        this.jumps,
        this.filescount,
        this.filessizetotal});

  PageLesson.fromJson(Map<String, dynamic> json) {
    page = json['page'] != null ? Page.fromJson(json['page']) : null;
    answerids = json['answerids'].cast<int>();
    jumps = json['jumps'].cast<int>();
    filescount = json['filescount'];
    filessizetotal = json['filessizetotal'];
  }

}

class Page {
  int? id;
  int? lessonid;
  int? prevpageid;
  int? nextpageid;
  int? qtype;
  int? qoption;
  int? layout;
  int? display;
  int? timecreated;
  int? timemodified;
  bool? displayinmenublock;
  int? type;
  int? typeid;
  String? typestring;

  Page(
      {this.id,
        this.lessonid,
        this.prevpageid,
        this.nextpageid,
        this.qtype,
        this.qoption,
        this.layout,
        this.display,
        this.timecreated,
        this.timemodified,
        this.displayinmenublock,
        this.type,
        this.typeid,
        this.typestring});

  Page.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lessonid = json['lessonid'];
    prevpageid = json['prevpageid'];
    nextpageid = json['nextpageid'];
    qtype = json['qtype'];
    qoption = json['qoption'];
    layout = json['layout'];
    display = json['display'];
    timecreated = json['timecreated'];
    timemodified = json['timemodified'];
    displayinmenublock = json['displayinmenublock'];
    type = json['type'];
    typeid = json['typeid'];
    typestring = json['typestring'];
  }

}
