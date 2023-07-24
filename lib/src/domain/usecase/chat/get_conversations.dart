part of 'chat.dart';

class GetConversations {
  final ChatRepositoryImpl chatRepositoryImpl;

  GetConversations(this.chatRepositoryImpl);

  Future<Either<Failure, List<ConversationModel>>> execute() async {
    return await chatRepositoryImpl.getConversations();
  }
}
