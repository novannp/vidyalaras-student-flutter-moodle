class SendMessageModel {
  final int msgid;
  final String text;
  final int timecreated;
  final int conversationid;
  final int useridfrom;
  final bool candeletemessagesforallusers;

  SendMessageModel({
    required this.msgid,
    required this.text,
    required this.timecreated,
    required this.conversationid,
    required this.useridfrom,
    required this.candeletemessagesforallusers,
  });

  factory SendMessageModel.fromJson(Map<String, dynamic> json) =>
      SendMessageModel(
        msgid: json["msgid"],
        text: json["text"],
        timecreated: json["timecreated"],
        conversationid: json["conversationid"],
        useridfrom: json["useridfrom"],
        candeletemessagesforallusers: json["candeletemessagesforallusers"],
      );

  Map<String, dynamic> toJson() => {
        "msgid": msgid,
        "text": text,
        "timecreated": timecreated,
        "conversationid": conversationid,
        "useridfrom": useridfrom,
        "candeletemessagesforallusers": candeletemessagesforallusers,
      };
}
