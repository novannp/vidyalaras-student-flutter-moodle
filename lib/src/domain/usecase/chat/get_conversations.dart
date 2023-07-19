import 'package:dartz/dartz.dart';

import '../../../data/models/conversation_model.dart';
import '../../../data/repositories/chat_repository_impl.dart';
import '../../../utils/failures.dart';

class GetConversations {
  final ChatRepositoryImpl chatRepositoryImpl;

  GetConversations(this.chatRepositoryImpl);

  Future<Either<Failure, List<ConversationModel>>> execute() async {
    return await chatRepositoryImpl.getConversations();
  }
}
