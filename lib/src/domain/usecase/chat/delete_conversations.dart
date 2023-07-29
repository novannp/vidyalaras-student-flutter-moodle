import 'package:dartz/dartz.dart';

import '../../../data/repositories/chat_repository_impl.dart';
import '../../../utils/failures.dart';

class DeleteConversation {
  final ChatRepositoryImpl chatRepositoryImpl;

  DeleteConversation(this.chatRepositoryImpl);

  Future<Either<Failure, bool>> execute(List<int> conversationIds) async {
    return await chatRepositoryImpl.deleteConversations(conversationIds);
  }
}