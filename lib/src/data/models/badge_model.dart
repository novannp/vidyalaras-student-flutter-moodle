class BadgeModel {
  int? id;
  String? name;
  String? description;
  int? timecreated;
  int? timemodified;
  int? usercreated;
  int? usermodified;
  String? issuername;
  String? issuerurl;
  String? issuercontact;
  int? expiredate;
  int? expireperiod;
  int? type;
  int? courseid;
  String? message;
  String? messagesubject;
  int? attachment;
  int? notification;
  int? status;
  int? issuedid;
  String? uniquehash;
  int? dateissued;
  int? dateexpire;
  int? visible;
  String? email;
  String? version;
  String? language;
  String? imageauthorname;
  String? imageauthoremail;
  String? imageauthorurl;
  String? imagecaption;
  String? badgeurl;

  BadgeModel({
    this.id,
    this.name,
    this.description,
    this.timecreated,
    this.timemodified,
    this.usercreated,
    this.usermodified,
    this.issuername,
    this.issuerurl,
    this.issuercontact,
    this.expiredate,
    this.expireperiod,
    this.type,
    this.courseid,
    this.message,
    this.messagesubject,
    this.attachment,
    this.notification,
    this.status,
    this.issuedid,
    this.uniquehash,
    this.dateissued,
    this.dateexpire,
    this.visible,
    this.email,
    this.version,
    this.language,
    this.imageauthorname,
    this.imageauthoremail,
    this.imageauthorurl,
    this.imagecaption,
    this.badgeurl,
  });

  factory BadgeModel.fromJson(Map<String, dynamic> json) {
    return BadgeModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        timecreated: json['timecreated'],
        timemodified: json['timemodified'],
        usercreated: json['usercreated'],
        usermodified: json['usermodified'],
        issuername: json['issuername'],
        issuerurl: json['issuerurl'],
        issuercontact: json['issuercontact'],
        expiredate: json['expiredate'],
        expireperiod: json['expireperiod'],
        type: json['type'],
        courseid: json['courseid'],
        message: json['message'],
        messagesubject: json['messagesubject'],
        attachment: json['attachment'],
        notification: json['notification'],
        status: json['status'],
        issuedid: json['issuedid'],
        uniquehash: json['uniquehash'],
        dateissued: json['dateissued'],
        dateexpire: json['dateexpire'],
        visible: json['visible'],
        email: json['email'],
        version: json['version'],
        language: json['language'],
        imageauthorname: json['imageauthorname'],
        imageauthoremail: json['imageauthoremail'],
        imageauthorurl: json['imageauthorurl'],
        imagecaption: json['imagecaption'],
        badgeurl: json['badgeurl']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['timecreated'] = timecreated;
    data['timemodified'] = timemodified;
    data['usercreated'] = usercreated;
    data['usermodified'] = usermodified;
    data['issuername'] = issuername;
    data['issuerurl'] = issuerurl;
    data['issuercontact'] = issuercontact;
    data['expiredate'] = expiredate;
    data['expireperiod'] = expireperiod;
    data['type'] = type;
    data['courseid'] = courseid;
    data['message'] = message;
    data['messagesubject'] = messagesubject;
    data['attachment'] = attachment;
    data['notification'] = notification;
    data['status'] = status;
    data['issuedid'] = issuedid;
    data['uniquehash'] = uniquehash;
    data['dateissued'] = dateissued;
    data['dateexpire'] = dateexpire;
    data['visible'] = visible;
    data['email'] = email;
    data['version'] = version;
    data['language'] = language;
    data['imageauthorname'] = imageauthorname;
    data['imageauthoremail'] = imageauthoremail;
    data['imageauthorurl'] = imageauthorurl;
    data['imagecaption'] = imagecaption;
    data['badgeurl'] = badgeurl;

    return data;
  }
}
