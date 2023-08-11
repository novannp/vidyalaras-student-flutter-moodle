part of 'chat.dart';

class UnsetConversationsFavorite {
  final ChatRepository chatRepositoryImpl;

  UnsetConversationsFavorite(this.chatRepositoryImpl);

  Future<Either<Failure, bool>> execute(int conversations) async {
    return await chatRepositoryImpl.unsetFavoriteConversations(conversations);
  }
}
