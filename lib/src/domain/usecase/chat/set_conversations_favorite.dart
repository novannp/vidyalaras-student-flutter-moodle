part of 'chat.dart';

class SetConversationsFavorite {
  final ChatRepositoryImpl chatRepositoryImpl;

  SetConversationsFavorite(this.chatRepositoryImpl);

  Future<Either<Failure, bool>> execute(int conversations) async {
    return await chatRepositoryImpl.setFavoriteConversations(conversations);
  }
}
