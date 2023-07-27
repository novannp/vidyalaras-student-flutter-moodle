import '../chat_model/message.dart';
import 'member.dart';

class ConversationModel {
  int? id;
  String? name;
  dynamic subname;
  dynamic imageurl;
  int? type;
  int? membercount;
  bool? ismuted;
  bool? isfavourite;
  bool? isread;
  int? unreadcount;
  List<Member>? members;
  List<Message>? messages;
  bool? candeletemessagesforallusers;

  ConversationModel({
    this.id,
    this.name,
    this.subname,
    this.imageurl,
    this.type,
    this.membercount,
    this.ismuted,
    this.isfavourite,
    this.isread,
    this.unreadcount,
    this.members,
    this.messages,
    this.candeletemessagesforallusers,
  });

  @override
  String toString() {
    return 'ConversationModel(id: $id, name: $name, subname: $subname, imageurl: $imageurl, type: $type, membercount: $membercount, ismuted: $ismuted, isfavourite: $isfavourite, isread: $isread, unreadcount: $unreadcount, members: $members, messages: $messages, candeletemessagesforallusers: $candeletemessagesforallusers)';
  }

  factory ConversationModel.fromJson(Map<String, dynamic> json) =>
      ConversationModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        subname: json['subname'] as dynamic,
        imageurl: json['imageurl'] as dynamic,
        type: json['type'] as int?,
        membercount: json['membercount'] as int?,
        ismuted: json['ismuted'] as bool?,
        isfavourite: json['isfavourite'] as bool?,
        isread: json['isread'] as bool?,
        unreadcount: json['unreadcount'] as int?,
        members: (json['members'] as List<dynamic>?)
            ?.map((e) => Member.fromJson(e as Map<String, dynamic>))
            .toList(),
        messages: (json['messages'] as List<dynamic>?)
            ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
            .toList(),
        candeletemessagesforallusers:
            json['candeletemessagesforallusers'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'subname': subname,
        'imageurl': imageurl,
        'type': type,
        'membercount': membercount,
        'ismuted': ismuted,
        'isfavourite': isfavourite,
        'isread': isread,
        'unreadcount': unreadcount,
        'members': members?.map((e) => e.toJson()).toList(),
        'messages': messages?.map((e) => e.toJson()).toList(),
        'candeletemessagesforallusers': candeletemessagesforallusers,
      };
}
