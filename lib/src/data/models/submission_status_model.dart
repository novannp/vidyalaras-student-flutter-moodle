class SubmissionStatusModel {
  Lastattempt? lastattempt;
  Feedback? feedback;

  SubmissionStatusModel({this.lastattempt, this.feedback});

  SubmissionStatusModel.fromJson(Map<String, dynamic> json) {
    lastattempt = json['lastattempt'] != null
        ? Lastattempt.fromJson(json['lastattempt'])
        : null;
    feedback =
        json['feedback'] != null ? Feedback.fromJson(json['feedback']) : null;
  }
}

class Lastattempt {
  Submission? submission;
  bool? submissionsenabled;
  bool? locked;
  bool? graded;
  bool? canedit;
  bool? caneditowner;
  bool? cansubmit;
  int? extensionduedate;
  bool? blindmarking;
  String? gradingstatus;
  List<int>? usergroups;

  Lastattempt(
      {this.submission,
      this.submissionsenabled,
      this.locked,
      this.graded,
      this.canedit,
      this.caneditowner,
      this.cansubmit,
      this.extensionduedate,
      this.blindmarking,
      this.gradingstatus,
      this.usergroups});

  Lastattempt.fromJson(Map<String, dynamic> json) {
    submission = json['submission'] != null
        ? Submission.fromJson(json['submission'])
        : null;

    submissionsenabled = json['submissionsenabled'];
    locked = json['locked'];
    graded = json['graded'];
    canedit = json['canedit'];
    caneditowner = json['caneditowner'];
    cansubmit = json['cansubmit'];
    extensionduedate = json['extensionduedate'];
    blindmarking = json['blindmarking'];
    gradingstatus = json['gradingstatus'];
    usergroups = json['usergroups'].cast<int>();
  }
}

class Submission {
  int? id;
  int? userid;
  int? attemptnumber;
  int? timecreated;
  int? timemodified;
  String? status;
  int? groupid;
  int? assignment;
  int? latest;
  List<Plugins>? plugins;

  Submission(
      {this.id,
      this.userid,
      this.attemptnumber,
      this.timecreated,
      this.timemodified,
      this.status,
      this.groupid,
      this.assignment,
      this.latest,
      this.plugins});

  Submission.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userid = json['userid'];
    attemptnumber = json['attemptnumber'];
    timecreated = json['timecreated'];
    timemodified = json['timemodified'];
    status = json['status'];
    groupid = json['groupid'];
    assignment = json['assignment'];
    latest = json['latest'];
    if (json['plugins'] != null) {
      plugins = <Plugins>[];
      json['plugins'].forEach((v) {
        plugins!.add(Plugins.fromJson(v));
      });
    }
  }
}

class Plugins {
  String? type;
  String? name;
  List<Fileareas>? fileareas;
  List<Editorfields>? editorfields;

  Plugins({this.type, this.name, this.fileareas, this.editorfields});

  Plugins.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    name = json['name'];
    if (json['fileareas'] != null) {
      fileareas = <Fileareas>[];
      json['fileareas'].forEach((v) {
        fileareas!.add(Fileareas.fromJson(v));
      });
    }
    if (json['editorfields'] != null) {
      editorfields = <Editorfields>[];
      json['editorfields'].forEach((v) {
        editorfields!.add(Editorfields.fromJson(v));
      });
    }
  }
}

class Fileareas {
  String? area;
  List<File>? files;

  Fileareas({this.area, this.files});

  Fileareas.fromJson(Map<String, dynamic> json) {
    area = json['area'];
    if (json['files'] != null) {
      files = <File>[];
      json['files'].forEach((v) {
        files!.add(File.fromJson(v));
      });
    }
  }
}

class File {
  String? filename;
  String? filepath;
  int? filesize;
  String? fileurl;
  int? timemodified;
  String? mimetype;
  bool? isexternalfile;

  File(
      {this.filename,
      this.filepath,
      this.filesize,
      this.fileurl,
      this.timemodified,
      this.mimetype,
      this.isexternalfile});

  File.fromJson(Map<String, dynamic> json) {
    filename = json['filename'];
    filepath = json['filepath'];
    filesize = json['filesize'];
    fileurl = json['fileurl'];
    timemodified = json['timemodified'];
    mimetype = json['mimetype'];
    isexternalfile = json['isexternalfile'];
  }
}

class Editorfields {
  String? name;
  String? description;
  String? text;
  int? format;

  Editorfields({this.name, this.description, this.text, this.format});

  Editorfields.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    text = json['text'];
    format = json['format'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['text'] = text;
    data['format'] = format;
    return data;
  }
}

class Feedback {
  Grade? grade;
  String? gradefordisplay;
  int? gradeddate;
  List<Plugins>? plugins;

  Feedback({this.grade, this.gradefordisplay, this.gradeddate, this.plugins});

  Feedback.fromJson(Map<String, dynamic> json) {
    grade = json['grade'] != null ? Grade.fromJson(json['grade']) : null;
    gradefordisplay = json['gradefordisplay'];
    gradeddate = json['gradeddate'];
    if (json['plugins'] != null) {
      plugins = <Plugins>[];
      json['plugins'].forEach((v) {
        plugins!.add(Plugins.fromJson(v));
      });
    }
  }
}

class Grade {
  int? id;
  int? assignment;
  int? userid;
  int? attemptnumber;
  int? timecreated;
  int? timemodified;
  int? grader;
  String? grade;

  Grade(
      {this.id,
      this.assignment,
      this.userid,
      this.attemptnumber,
      this.timecreated,
      this.timemodified,
      this.grader,
      this.grade});

  Grade.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    assignment = json['assignment'];
    userid = json['userid'];
    attemptnumber = json['attemptnumber'];
    timecreated = json['timecreated'];
    timemodified = json['timemodified'];
    grader = json['grader'];
    grade = json['grade'];
  }
}
