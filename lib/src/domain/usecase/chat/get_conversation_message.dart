import 'package:dartz/dartz.dart';

import '../../../data/models/chat_model.dart';
import '../../../data/repositories/chat_repository_impl.dart';
import '../../../utils/failures.dart';

class GetConversationMessage {
  final ChatRepositoryImpl chatRepositoryImpl;

  GetConversationMessage(this.chatRepositoryImpl);

  Future<Either<Failure, ChatModel>> execute(int conversationId) async {
    return await chatRepositoryImpl.getConversationMessage(conversationId);
  }
}
