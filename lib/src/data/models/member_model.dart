class MemberModel {
  final int id;
  final String fullname;
  final String profileurl;
  final String profileimageurl;
  final String profileimageurlsmall;
  final dynamic isonline;
  final bool showonlinestatus;
  final bool isblocked;
  final bool iscontact;
  final bool isdeleted;
  final dynamic canmessageevenifblocked;
  final dynamic canmessage;
  final dynamic requirescontact;
  final List<dynamic> contactrequests;

  MemberModel({
    required this.id,
    required this.fullname,
    required this.profileurl,
    required this.profileimageurl,
    required this.profileimageurlsmall,
    required this.isonline,
    required this.showonlinestatus,
    required this.isblocked,
    required this.iscontact,
    required this.isdeleted,
    required this.canmessageevenifblocked,
    required this.canmessage,
    required this.requirescontact,
    required this.contactrequests,
  });

  factory MemberModel.fromJson(Map<String, dynamic> json) => MemberModel(
        id: json["id"],
        fullname: json["fullname"],
        profileurl: json["profileurl"],
        profileimageurl: json["profileimageurl"],
        profileimageurlsmall: json["profileimageurlsmall"],
        isonline: json["isonline"],
        showonlinestatus: json["showonlinestatus"],
        isblocked: json["isblocked"],
        iscontact: json["iscontact"],
        isdeleted: json["isdeleted"],
        canmessageevenifblocked: json["canmessageevenifblocked"],
        canmessage: json["canmessage"],
        requirescontact: json["requirescontact"],
        contactrequests:
            List<dynamic>.from(json["contactrequests"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "profileurl": profileurl,
        "profileimageurl": profileimageurl,
        "profileimageurlsmall": profileimageurlsmall,
        "isonline": isonline,
        "showonlinestatus": showonlinestatus,
        "isblocked": isblocked,
        "iscontact": iscontact,
        "isdeleted": isdeleted,
        "canmessageevenifblocked": canmessageevenifblocked,
        "canmessage": canmessage,
        "requirescontact": requirescontact,
        "contactrequests": List<dynamic>.from(contactrequests.map((x) => x)),
      };
}
