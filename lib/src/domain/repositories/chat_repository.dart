import 'package:dartz/dartz.dart';

import '../../data/models/chat_model/chat_model.dart';
import '../../data/models/chat_model/send_message_model.dart';
import '../../data/models/conversation_model/conversation.dart';
import '../../data/models/member_model.dart';
import '../../utils/failures.dart';

abstract class ChatRepository {
  Future<Either<Failure, List<ConversationModel>>> getConversations();
  Future<Either<Failure, ChatModel>> getConversationMessage(int conversationId);

  Future<Either<Failure, MemberModel>> getMemberInfo(int memberId);
  Future<Either<Failure, SendMessageModel>> sendInstantMessage(
      int toUserId, String message);
  Future<Either<Failure, int>> getUnreadMessageCount();
  Future<Either<Failure, bool>> setFavoriteConversations(int conversations);
  Future<Either<Failure, bool>> unsetFavoriteConversations(int conversations);
  Future<Either<Failure, ConversationModel>> getConversationsBetweenUser(
      int otheruserid);
  Future<Either<Failure, bool>> deleteConversations(int conversationIds);
  Future<Either<Failure, bool>> blockUser(int blockedUserId);
  Future<Either<Failure, bool>> unblockUser(int unblockUserId);
}
