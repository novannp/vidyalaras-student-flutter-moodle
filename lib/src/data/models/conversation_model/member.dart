class Member {
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
  List<dynamic>? contactrequests;

  Member({
    this.id,
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
    this.contactrequests,
  });

  @override
  String toString() {
    return 'Member(id: $id, fullname: $fullname, profileurl: $profileurl, profileimageurl: $profileimageurl, profileimageurlsmall: $profileimageurlsmall, isonline: $isonline, showonlinestatus: $showonlinestatus, isblocked: $isblocked, iscontact: $iscontact, isdeleted: $isdeleted, canmessageevenifblocked: $canmessageevenifblocked, canmessage: $canmessage, requirescontact: $requirescontact, contactrequests: $contactrequests)';
  }

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        id: json['id'] as int?,
        fullname: json['fullname'] as String?,
        profileurl: json['profileurl'] as String?,
        profileimageurl: json['profileimageurl'] as String?,
        profileimageurlsmall: json['profileimageurlsmall'] as String?,
        isonline: json['isonline'] as bool?,
        showonlinestatus: json['showonlinestatus'] as bool?,
        isblocked: json['isblocked'] as bool?,
        iscontact: json['iscontact'] as bool?,
        isdeleted: json['isdeleted'] as bool?,
        canmessageevenifblocked: json['canmessageevenifblocked'] as bool?,
        canmessage: json['canmessage'] as bool?,
        requirescontact: json['requirescontact'] as bool?,
        contactrequests: json['contactrequests'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullname': fullname,
        'profileurl': profileurl,
        'profileimageurl': profileimageurl,
        'profileimageurlsmall': profileimageurlsmall,
        'isonline': isonline,
        'showonlinestatus': showonlinestatus,
        'isblocked': isblocked,
        'iscontact': iscontact,
        'isdeleted': isdeleted,
        'canmessageevenifblocked': canmessageevenifblocked,
        'canmessage': canmessage,
        'requirescontact': requirescontact,
        'contactrequests': contactrequests,
      };
}
