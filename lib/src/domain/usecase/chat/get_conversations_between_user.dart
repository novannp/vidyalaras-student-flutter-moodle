part of 'chat.dart';

class GetConversationsBetweenUser {
  final ChatRepository chatRepositoryImpl;

  GetConversationsBetweenUser(this.chatRepositoryImpl);

  Future<Either<Failure, ConversationModel>> execute(int otherUserId) async {
    return await chatRepositoryImpl.getConversationsBetweenUser(otherUserId);
  }
}
