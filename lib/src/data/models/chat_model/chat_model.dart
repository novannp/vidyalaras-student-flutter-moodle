import '../conversation_model/member.dart';
import 'message.dart';

class ChatModel {
  int? id;
  List<Member>? members;
  List<Message>? messages;

  ChatModel({this.id, this.members, this.messages});

  @override
  String toString() {
    return 'ChatModel(id: $id, members: $members, messages: $messages)';
  }

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        id: json['id'] as int?,
        members: (json['members'] as List<dynamic>?)
            ?.map((e) => Member.fromJson(e as Map<String, dynamic>))
            .toList(),
        messages: (json['messages'] as List<dynamic>?)
            ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
            .toList()
            .reversed
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'members': members?.map((e) => e.toJson()).toList(),
        'messages': messages?.map((e) => e.toJson()).toList(),
      };
}
