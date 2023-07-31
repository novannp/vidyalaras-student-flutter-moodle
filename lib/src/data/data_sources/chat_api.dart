import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

import '../../utils/endpoints.dart';
import '../../utils/exceptions.dart';
import '../models/chat_model/chat_model.dart';
import '../models/chat_model/send_message_model.dart';
import '../models/conversation_model/conversation.dart';
import '../models/member_model.dart';

abstract class ChatApi {
  Future<List<ConversationModel>> getConversations(
    String token,
    int userId,
  );

  Future<ChatModel> getConversationMessage(
    String token,
    int userId,
    int conversationId,
  );

  Future<int> getUnreadConversationCount(String token, int userId);

  Future<SendMessageModel> sendInstantMessage(
      String token, int toUserId, String message);

  Future<MemberModel> getMemberInfo(
      String token, int referenceUserId, int memberId);

  Future<ConversationModel> getConversationsBetweenUser(
      String token, int userId, int otheruserid);

  Future setConversationFavorite(String token, int userId, int conversations);

  Future unsetConversationFavorite(String token, int userId, int conversations);

  Future deleteConversation(String token, int userId, int conversationIds);

  Future blockUser(String token, int userId, int blockedUserId);
  Future unblockUser(String token, int userId, int blockedUserId);
}

class ChatApiImpl implements ChatApi {
  final Client client;

  ChatApiImpl(this.client);

  @override
  Future<List<ConversationModel>> getConversations(
      String token, int userId) async {
    Uri url = Uri.https(
      Endpoints.baseUrl,
      Endpoints.rest,
      {
        'wstoken': token,
        'wsfunction': 'core_message_get_conversations',
        'moodlewsrestformat': 'json',
        'userid': userId,
      }.map((key, value) => MapEntry(key, value.toString())),
    );
    final response = await client.get(url);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body)['conversations'];
      if (result.isEmpty) {
        return <ConversationModel>[];
      }
      final conversations = result
          .map<ConversationModel>((e) => ConversationModel.fromJson(e))
          .toList();
      return conversations;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ChatModel> getConversationMessage(
      String token, int userId, int conversationId) async {
    Uri url = Uri.https(
      Endpoints.baseUrl,
      Endpoints.rest,
      {
        'wstoken': token,
        'wsfunction': 'core_message_get_conversation_messages',
        'moodlewsrestformat': 'json',
        'currentuserid': userId,
        'convid': conversationId,
      }.map((key, value) => MapEntry(key, value.toString())),
    );

    Uri url2 = Uri.https(
      Endpoints.baseUrl,
      Endpoints.rest,
      {
        'wstoken': token,
        'wsfunction': 'core_message_mark_all_conversation_messages_as_read',
        'moodlewsrestformat': 'json',
        'userid': userId,
        'conversationid': conversationId,
      }.map((key, value) => MapEntry(key, value.toString())),
    );
    final response = await client.get(url);
    await client.get(url2);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);

      final messages = ChatModel.fromJson(result);
      return messages;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<int> getUnreadConversationCount(String token, int userId) async {
    Uri url = Uri.https(
      Endpoints.baseUrl,
      Endpoints.rest,
      {
        'wstoken': token,
        'wsfunction': 'core_message_get_unread_conversations_count',
        'moodlewsrestformat': 'json',
        'useridto': userId,
      }.map(
        (key, value) => MapEntry(key, value.toString()),
      ),
    );

    final response = await client.get(url);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body) as int;
      return result;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<SendMessageModel> sendInstantMessage(
      String token, int toUserId, String message) async {
    Uri url = Uri.https(
      Endpoints.baseUrl,
      Endpoints.rest,
      {
        'wstoken': token,
        'wsfunction': 'core_message_send_instant_messages',
        'moodlewsrestformat': 'json',
        'messages[0][touserid]': toUserId,
        'messages[0][text]': message,
      }.map((key, value) => MapEntry(key, value.toString())),
    );
    log(message);
    final response = await client.post(url);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body) as List;
      final message = SendMessageModel.fromJson(result[0]);
      message.toString();
      return message;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MemberModel> getMemberInfo(
      String token, int referenceUserId, int memberId) async {
    Uri url = Uri.https(
      Endpoints.baseUrl,
      Endpoints.rest,
      {
        "wstoken": token,
        "wsfunction": "core_message_get_member_info",
        "moodlewsrestformat": "json",
        "referenceuserid": referenceUserId,
        "userids[0]": memberId,
      }.map(
        (key, value) => MapEntry(key, value.toString()),
      ),
    );

    final response = await client.get(url);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body) as List;
      final member = MemberModel.fromJson(result[0]);
      return member;
    } else {
      throw ServerException();
    }
  }

  @override
  Future deleteConversation(
      String token, int userId, int conversationIds) async {
    Uri url = Uri.https(
      Endpoints.baseUrl,
      Endpoints.rest,
      {
        "wstoken": token,
        "wsfunction": "core_message_delete_conversations_by_id",
        "moodlewsrestformat": "json",
        "userid": userId,
        "conversationids[0]": conversationIds,
      }.map(
        (key, value) => MapEntry(key, value.toString()),
      ),
    );

    final response = await client.get(url);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future setConversationFavorite(
      String token, int userId, int conversations) async {
    Uri url = Uri.https(
      Endpoints.baseUrl,
      Endpoints.rest,
      {
        "wstoken": token,
        "wsfunction": "core_message_set_favourite_conversations",
        "moodlewsrestformat": "json",
        "userid": userId,
        "conversations[0]": conversations,
      }.map(
        (key, value) => MapEntry(key, value.toString()),
      ),
    );

    print(url);

    final response = await client.get(url);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<ConversationModel> getConversationsBetweenUser(
      String token, int userId, int otheruserid) async {
    Uri url = Uri.https(
      Endpoints.baseUrl,
      Endpoints.rest,
      {
        "wstoken": token,
        "wsfunction": "core_message_get_conversation_between_users",
        "moodlewsrestformat": "json",
        "userid": userId,
        "otheruserid": otheruserid,
        "includecontactrequests": 0,
        "includeprivacyinfo": 0,
      }.map(
        (key, value) => MapEntry(key, value.toString()),
      ),
    );

    final response = await client.get(url);
    print(response.body);
    final message = jsonDecode(response.body)['message'];
    if (message != "Conversation does not exist") {
      final ConversationModel data =
          ConversationModel.fromJson(jsonDecode(response.body));
      print(data);
      return data;
    } else {
      throw ServerException();
    }
  }

  @override
  Future unsetConversationFavorite(
      String token, int userId, int conversations) async {
    Uri url = Uri.https(
      Endpoints.baseUrl,
      Endpoints.rest,
      {
        "wstoken": token,
        "wsfunction": "core_message_unset_favourite_conversations",
        "moodlewsrestformat": "json",
        "userid": userId,
        "conversations[0]": conversations,
      }.map(
        (key, value) => MapEntry(key, value.toString()),
      ),
    );
    print(url);

    final response = await client.get(url);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future blockUser(String token, int userId, int blockedUserId) async{
    Uri url = Uri.https(
      Endpoints.baseUrl,
      Endpoints.rest,
      {
        "wstoken": token,
        "wsfunction": "core_message_block_user",
        "moodlewsrestformat": "json",
        "userid": userId,
        "blockeduserid" : blockedUserId,
      }.map(
            (key, value) => MapEntry(key, value.toString()),
      ),
    );
    print(url);

    final response = await client.get(url);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future unblockUser(String token, int userId, int unblockUserId)async {
    Uri url = Uri.https(
      Endpoints.baseUrl,
      Endpoints.rest,
      {
        "wstoken": token,
        "wsfunction": "core_message_unblock_user",
        "moodlewsrestformat": "json",
        "userid": userId,
        "unblockeduserid" : unblockUserId,
      }.map(
            (key, value) => MapEntry(key, value.toString()),
      ),
    );
    print(url);

    final response = await client.get(url);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  }

