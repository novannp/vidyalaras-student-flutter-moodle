import 'package:dartz/dartz.dart';

import '../../data/models/chat_model.dart';
import '../../data/models/conversation_model.dart';
import '../../data/models/member_model.dart';
import '../../data/models/message_model.dart';
import '../../utils/failures.dart';

abstract class ChatRepository {
  Future<Either<Failure, List<ConversationModel>>> getConversations();
  Future<Either<Failure, ChatModel>> getConversationMessage(int conversationId);

  Future<Either<Failure, MemberModel>> getMemberInfo(int memberId);
  Future<Either<Failure, Message>> sendInstantMessage(
      int toUserId, String message);
  Future<Either<Failure, int>> getUnreadMessageCount();
}
