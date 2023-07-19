import 'conversation_model.dart';

class ChatModel {
  int? id;
  List<Members>? members;
  List<Messages>? messages;

  ChatModel({this.id, this.members, this.messages});

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'],
      members: json['members'] != null
          ? (json['members'] as List).map((i) => Members.fromJson(i)).toList()
          : [],
      messages: json['messages'] != null
          ? (json['messages'] as List)
              .map((i) => Messages.fromJson(i))
              .toList()
              .reversed
              .toList()
          : [],
    );
  }
}
