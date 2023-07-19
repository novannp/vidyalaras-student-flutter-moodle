class ConversationModel {
  int? id;
  String? name;
  String? subname;
  String? imageurl;
  int? type;
  int? membercount;
  bool? ismuted;
  bool? isonline;
  bool? isfavourite;
  bool? isread;
  int? unreadcount;
  List<Members>? members;
  List<Messages>? messages;
  bool? candeletemessagesforallusers;

  ConversationModel(
      {this.id,
      this.name,
      this.subname,
      this.imageurl,
      this.type,
      this.membercount,
      this.ismuted,
      this.isonline,
      this.isfavourite,
      this.isread,
      this.unreadcount,
      this.members,
      this.messages,
      this.candeletemessagesforallusers});

  ConversationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    subname = json['subname'];
    imageurl = json['imageurl'];
    type = json['type'];
    membercount = json['membercount'];
    ismuted = json['ismuted'];
    isfavourite = json['isfavourite'];
    isonline = json['isonline'] ?? false;
    isread = json['isread'];
    unreadcount = json['unreadcount'];
    if (json['members'] != null) {
      members = <Members>[];
      json['members'].forEach((v) {
        members!.add(Members.fromJson(v));
      });
    }
    if (json['messages'] != null) {
      messages = <Messages>[];
      json['messages'].forEach((v) {
        messages!.add(Messages.fromJson(v));
      });
    }
    candeletemessagesforallusers = json['candeletemessagesforallusers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['subname'] = subname;
    data['imageurl'] = imageurl;
    data['type'] = type;
    data['membercount'] = membercount;
    data['ismuted'] = ismuted;
    data['isfavourite'] = isfavourite;
    data['isread'] = isread;
    data['unreadcount'] = unreadcount;
    if (members != null) {
      data['members'] = members!.map((v) => v.toJson()).toList();
    }
    if (messages != null) {
      data['messages'] = messages!.map((v) => v.toJson()).toList();
    }
    data['candeletemessagesforallusers'] = candeletemessagesforallusers;
    return data;
  }
}

class Members {
  int? id;
  String? fullname;
  String? profileurl;
  String? profileimageurl;
  String? profileimageurlsmall;
  bool? isonline;
  bool? showonlinestatus;
  bool? isblocked;
  bool? iscontact;
  bool? isdeleted;
  bool? canmessageevenifblocked;
  bool? canmessage;
  bool? requirescontact;
  List? contactrequests;

  Members(
      {this.id,
      this.fullname,
      this.profileurl,
      this.profileimageurl,
      this.profileimageurlsmall,
      this.isonline,
      this.showonlinestatus,
      this.isblocked,
      this.iscontact,
      this.isdeleted,
      this.canmessageevenifblocked,
      this.canmessage,
      this.requirescontact,
      this.contactrequests});

  Members.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    profileurl = json['profileurl'];
    profileimageurl = json['profileimageurl'];
    profileimageurlsmall = json['profileimageurlsmall'];
    isonline = json['isonline'];
    showonlinestatus = json['showonlinestatus'];
    isblocked = json['isblocked'];
    iscontact = json['iscontact'];
    isdeleted = json['isdeleted'];
    canmessageevenifblocked = json['canmessageevenifblocked'];
    canmessage = json['canmessage'];
    requirescontact = json['requirescontact'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullname'] = fullname;
    data['profileurl'] = profileurl;
    data['profileimageurl'] = profileimageurl;
    data['profileimageurlsmall'] = profileimageurlsmall;
    data['isonline'] = isonline;
    data['showonlinestatus'] = showonlinestatus;
    data['isblocked'] = isblocked;
    data['iscontact'] = iscontact;
    data['isdeleted'] = isdeleted;
    data['canmessageevenifblocked'] = canmessageevenifblocked;
    data['canmessage'] = canmessage;
    data['requirescontact'] = requirescontact;

    return data;
  }
}

class Messages {
  int? id;
  int? useridfrom;
  String? text;
  int? timecreated;

  Messages({this.id, this.useridfrom, this.text, this.timecreated});

  Messages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    useridfrom = json['useridfrom'];
    text = json['text'];
    timecreated = json['timecreated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['useridfrom'] = useridfrom;
    data['text'] = text;
    data['timecreated'] = timecreated;
    return data;
  }
}
