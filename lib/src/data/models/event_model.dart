import 'dart:ui';

class EventModel {
  int? id;
  Color? background;
  String? name;
  String? description;
  int? format;
  int? courseid;
  int? categoryid;
  int? groupid;
  int? userid;
  int? repeatid;
  // Null? modulename;
  // Null? instance;
  String? eventtype;
  int? timestart;
  int? timeduration;
  int? visible;
  int? sequence;
  int? timemodified;
  int? subscriptionid;

  EventModel(
      {this.id,
      this.name,
      this.background,
      this.description,
      this.format,
      this.courseid,
      this.categoryid,
      this.groupid,
      this.userid,
      this.repeatid,
      // this.modulename,
      // this.instance,
      this.eventtype,
      this.timestart,
      this.timeduration,
      this.visible,
      this.sequence,
      this.timemodified,
      this.subscriptionid});

  EventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    format = json['format'];
    courseid = json['courseid'];
    categoryid = json['categoryid'];
    groupid = json['groupid'];
    userid = json['userid'];
    repeatid = json['repeatid'];
    // modulename = json['modulename'];
    // instance = json['instance'];
    eventtype = json['eventtype'];
    timestart = json['timestart'];
    timeduration = json['timeduration'];
    visible = json['visible'];
    sequence = json['sequence'];
    timemodified = json['timemodified'];
    subscriptionid = json['subscriptionid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['format'] = format;
    data['courseid'] = courseid;
    data['categoryid'] = categoryid;
    data['groupid'] = groupid;
    data['userid'] = userid;
    data['repeatid'] = repeatid;
    // data['modulename'] = modulename;
    // data['instance'] = instance;
    data['eventtype'] = eventtype;
    data['timestart'] = timestart;
    data['timeduration'] = timeduration;
    data['visible'] = visible;
    data['sequence'] = sequence;
    data['timemodified'] = timemodified;
    data['subscriptionid'] = subscriptionid;
    return data;
  }
}
