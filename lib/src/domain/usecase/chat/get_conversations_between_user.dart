part of'chat.dart';

class GetConversationsBetweenUser {
  final ChatRepositoryImpl chatRepositoryImpl;

  GetConversationsBetweenUser(this.chatRepositoryImpl);

  Future<Either<Failure, ConversationModel>> execute(int otherUserId) async {
    return await chatRepositoryImpl.getConversationsBetweenUser(otherUserId);
  }
}