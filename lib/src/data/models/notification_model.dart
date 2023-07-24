class NotificationModel {
  int? id;
  int? useridfrom;
  int? useridto;
  String? subject;
  String? text;
  String? fullmessage;
  int? fullmessageformat;
  String? fullmessagehtml;
  String? smallmessage;
  int? notification;
  String? contexturl;
  String? contexturlname;
  int? timecreated;
  int? timeread;
  String? usertofullname;
  String? userfromfullname;
  String? component;
  String? eventtype;
  String? customdata;

  NotificationModel(
      {this.id,
      this.useridfrom,
      this.useridto,
      this.subject,
      this.text,
      this.fullmessage,
      this.fullmessageformat,
      this.fullmessagehtml,
      this.smallmessage,
      this.notification,
      this.contexturl,
      this.contexturlname,
      this.timecreated,
      this.timeread,
      this.usertofullname,
      this.userfromfullname,
      this.component,
      this.eventtype,
      this.customdata});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    useridfrom = json['useridfrom'];
    useridto = json['useridto'];
    subject = json['subject'];
    text = json['text'];
    fullmessage = json['fullmessage'];
    fullmessageformat = json['fullmessageformat'];
    fullmessagehtml = json['fullmessagehtml'];
    smallmessage = json['smallmessage'];
    notification = json['notification'];
    contexturl = json['contexturl'];
    contexturlname = json['contexturlname'];
    timecreated = json['timecreated'];
    timeread = json['timeread'];
    usertofullname = json['usertofullname'];
    userfromfullname = json['userfromfullname'];
    component = json['component'];
    eventtype = json['eventtype'];
    customdata = json['customdata'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['useridfrom'] = useridfrom;
    data['useridto'] = useridto;
    data['subject'] = subject;
    data['text'] = text;
    data['fullmessage'] = fullmessage;
    data['fullmessageformat'] = fullmessageformat;
    data['fullmessagehtml'] = fullmessagehtml;
    data['smallmessage'] = smallmessage;
    data['notification'] = notification;
    data['contexturl'] = contexturl;
    data['contexturlname'] = contexturlname;
    data['timecreated'] = timecreated;
    data['timeread'] = timeread;
    data['usertofullname'] = usertofullname;
    data['userfromfullname'] = userfromfullname;
    data['component'] = component;
    data['eventtype'] = eventtype;
    data['customdata'] = customdata;
    return data;
  }
}
// class NotificationModel {
//   int? id;
//   int? useridfrom;
//   int? useridto;
//   String? subject;
//   String? shortenedsubject;
//   String? text;
//   String? fullmessage;
//   int? fullmessageformat;
//   String? fullmessagehtml;
//   String? smallmessage;
//   String? contexturl;
//   String? contexturlname;
//   int? timecreated;
//   String? timecreatedpretty;
//   int? timeread;
//   bool? read;
//   bool? deleted;
//   String? iconurl;
//   String? component;
//   String? eventtype;
//   dynamic? customdata;

//   NotificationModel(
//       {this.id,
//       this.useridfrom,
//       this.useridto,
//       this.subject,
//       this.shortenedsubject,
//       this.text,
//       this.fullmessage,
//       this.fullmessageformat,
//       this.fullmessagehtml,
//       this.smallmessage,
//       this.contexturl,
//       this.contexturlname,
//       this.timecreated,
//       this.timecreatedpretty,
//       this.timeread,
//       this.read,
//       this.deleted,
//       this.iconurl,
//       this.component,
//       this.eventtype,
//       this.customdata});

//   factory NotificationModel.fromJson(Map<String, dynamic> json) {
//     return NotificationModel(
//       id: json['id'],
//       useridfrom: json['useridfrom'],
//       useridto: json['useridto'],
//       subject: json['subject'],
//       shortenedsubject: json['shortenedsubject'],
//       text: json['text'],
//       fullmessage: json['fullmessage'],
//       fullmessageformat: json['fullmessageformat'],
//       fullmessagehtml: json['fullmessagehtml'],
//       smallmessage: json['smallmessage'],
//       contexturl: json['contexturl'],
//       contexturlname: json['contexturlname'],
//       timecreated: json['timecreated'],
//       timecreatedpretty: json['timecreatedpretty'],
//       timeread: json['timeread'],
//       read: json['read'],
//       deleted: json['deleted'],
//       iconurl: json['iconurl'],
//       component: json['component'],
//       eventtype: json['eventtype'],
//       customdata: json['customdata'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['useridfrom'] = this.useridfrom;
//     data['useridto'] = this.useridto;
//     data['subject'] = this.subject;
//     data['shortenedsubject'] = this.shortenedsubject;
//     data['text'] = this.text;
//     data['fullmessage'] = this.fullmessage;
//     data['fullmessageformat'] = this.fullmessageformat;
//     data['fullmessagehtml'] = this.fullmessagehtml;
//     data['smallmessage'] = this.smallmessage;
//     data['contexturl'] = this.contexturl;
//     data['contexturlname'] = this.contexturlname;
//     data['timecreated'] = this.timecreated;
//     data['timecreatedpretty'] = this.timecreatedpretty;
//     data['timeread'] = this.timeread;
//     data['read'] = this.read;
//     data['deleted'] = this.deleted;
//     data['iconurl'] = this.iconurl;
//     data['component'] = this.component;
//     data['eventtype'] = this.eventtype;
//     data['customdata'] = this.customdata;
//     return data;
//   }
// }
