part of 'chat.dart';

class GetConversationMessage {
  final ChatRepositoryImpl chatRepositoryImpl;

  GetConversationMessage(this.chatRepositoryImpl);

  Future<Either<Failure, ChatModel>> execute(int conversationId) async {
    return await chatRepositoryImpl.getConversationMessage(conversationId);
  }
}
