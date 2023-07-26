class AssignmentModel {
  int? id;
  int? cmid;
  int? course;
  String? name;
  int? nosubmissions;
  int? submissiondrafts;
  int? sendnotifications;
  int? sendlatenotifications;
  int? sendstudentnotifications;
  int? duedate;
  int? allowsubmissionsfromdate;
  int? grade;
  int? timemodified;
  int? completionsubmit;
  int? cutoffdate;
  int? gradingduedate;
  int? teamsubmission;
  int? requireallteammemberssubmit;
  int? teamsubmissiongroupingid;
  int? blindmarking;
  int? hidegrader;
  int? revealidentities;
  String? attemptreopenmethod;
  int? maxattempts;
  int? markingworkflow;
  int? markingallocation;
  int? requiresubmissionstatement;
  int? preventsubmissionnotingroup;
  List<Configs>? configs;
  String? intro;
  int? introformat;
  List<Introattachments>? introattachments;

  AssignmentModel(
      {this.id,
      this.cmid,
      this.course,
      this.name,
      this.nosubmissions,
      this.submissiondrafts,
      this.sendnotifications,
      this.sendlatenotifications,
      this.sendstudentnotifications,
      this.duedate,
      this.allowsubmissionsfromdate,
      this.grade,
      this.timemodified,
      this.completionsubmit,
      this.cutoffdate,
      this.gradingduedate,
      this.teamsubmission,
      this.requireallteammemberssubmit,
      this.teamsubmissiongroupingid,
      this.blindmarking,
      this.hidegrader,
      this.revealidentities,
      this.attemptreopenmethod,
      this.maxattempts,
      this.markingworkflow,
      this.markingallocation,
      this.requiresubmissionstatement,
      this.preventsubmissionnotingroup,
      this.configs,
      this.intro,
      this.introformat,
      this.introattachments});

  AssignmentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cmid = json['cmid'];
    course = json['course'];
    name = json['name'];
    nosubmissions = json['nosubmissions'];
    submissiondrafts = json['submissiondrafts'];
    sendnotifications = json['sendnotifications'];
    sendlatenotifications = json['sendlatenotifications'];
    sendstudentnotifications = json['sendstudentnotifications'];
    duedate = json['duedate'];
    allowsubmissionsfromdate = json['allowsubmissionsfromdate'];
    grade = json['grade'];
    timemodified = json['timemodified'];
    completionsubmit = json['completionsubmit'];
    cutoffdate = json['cutoffdate'];
    gradingduedate = json['gradingduedate'];
    teamsubmission = json['teamsubmission'];
    requireallteammemberssubmit = json['requireallteammemberssubmit'];
    teamsubmissiongroupingid = json['teamsubmissiongroupingid'];
    blindmarking = json['blindmarking'];
    hidegrader = json['hidegrader'];
    revealidentities = json['revealidentities'];
    attemptreopenmethod = json['attemptreopenmethod'];
    maxattempts = json['maxattempts'];
    markingworkflow = json['markingworkflow'];
    markingallocation = json['markingallocation'];
    requiresubmissionstatement = json['requiresubmissionstatement'];
    preventsubmissionnotingroup = json['preventsubmissionnotingroup'];
    if (json['configs'] != null) {
      configs = <Configs>[];
      json['configs'].forEach((v) {
        configs!.add(new Configs.fromJson(v));
      });
    }
    intro = json['intro'];
    introformat = json['introformat'];

    if (json['introattachments'] != null) {
      introattachments = <Introattachments>[];
      json['introattachments'].forEach((v) {
        introattachments!.add(new Introattachments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cmid'] = this.cmid;
    data['course'] = this.course;
    data['name'] = this.name;
    data['nosubmissions'] = this.nosubmissions;
    data['submissiondrafts'] = this.submissiondrafts;
    data['sendnotifications'] = this.sendnotifications;
    data['sendlatenotifications'] = this.sendlatenotifications;
    data['sendstudentnotifications'] = this.sendstudentnotifications;
    data['duedate'] = this.duedate;
    data['allowsubmissionsfromdate'] = this.allowsubmissionsfromdate;
    data['grade'] = this.grade;
    data['timemodified'] = this.timemodified;
    data['completionsubmit'] = this.completionsubmit;
    data['cutoffdate'] = this.cutoffdate;
    data['gradingduedate'] = this.gradingduedate;
    data['teamsubmission'] = this.teamsubmission;
    data['requireallteammemberssubmit'] = this.requireallteammemberssubmit;
    data['teamsubmissiongroupingid'] = this.teamsubmissiongroupingid;
    data['blindmarking'] = this.blindmarking;
    data['hidegrader'] = this.hidegrader;
    data['revealidentities'] = this.revealidentities;
    data['attemptreopenmethod'] = this.attemptreopenmethod;
    data['maxattempts'] = this.maxattempts;
    data['markingworkflow'] = this.markingworkflow;
    data['markingallocation'] = this.markingallocation;
    data['requiresubmissionstatement'] = this.requiresubmissionstatement;
    data['preventsubmissionnotingroup'] = this.preventsubmissionnotingroup;
    if (this.configs != null) {
      data['configs'] = this.configs!.map((v) => v.toJson()).toList();
    }
    data['intro'] = this.intro;
    data['introformat'] = this.introformat;

    if (this.introattachments != null) {
      data['introattachments'] =
          this.introattachments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Configs {
  String? plugin;
  String? subtype;
  String? name;
  String? value;

  Configs({this.plugin, this.subtype, this.name, this.value});

  Configs.fromJson(Map<String, dynamic> json) {
    plugin = json['plugin'];
    subtype = json['subtype'];
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plugin'] = this.plugin;
    data['subtype'] = this.subtype;
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}

class Introattachments {
  String? filename;
  String? filepath;
  int? filesize;
  String? fileurl;
  int? timemodified;
  String? mimetype;
  bool? isexternalfile;

  Introattachments(
      {this.filename,
      this.filepath,
      this.filesize,
      this.fileurl,
      this.timemodified,
      this.mimetype,
      this.isexternalfile});

  Introattachments.fromJson(Map<String, dynamic> json) {
    filename = json['filename'];
    filepath = json['filepath'];
    filesize = json['filesize'];
    fileurl = json['fileurl'];
    timemodified = json['timemodified'];
    mimetype = json['mimetype'];
    isexternalfile = json['isexternalfile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['filename'] = this.filename;
    data['filepath'] = this.filepath;
    data['filesize'] = this.filesize;
    data['fileurl'] = this.fileurl;
    data['timemodified'] = this.timemodified;
    data['mimetype'] = this.mimetype;
    data['isexternalfile'] = this.isexternalfile;
    return data;
  }
}
