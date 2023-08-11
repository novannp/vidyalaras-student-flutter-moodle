part of 'chat.dart';

class SetConversationsFavorite {
  final ChatRepository chatRepositoryImpl;

  SetConversationsFavorite(this.chatRepositoryImpl);

  Future<Either<Failure, bool>> execute(int conversations) async {
    return await chatRepositoryImpl.setFavoriteConversations(conversations);
  }
}
