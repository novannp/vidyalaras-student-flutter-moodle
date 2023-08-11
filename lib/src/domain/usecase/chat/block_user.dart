part of 'chat.dart';

class BlockUser {
  final ChatRepository chatRepositoryImpl;

  BlockUser(this.chatRepositoryImpl);

  Future<Either<Failure, bool>> execute(int blockedUserId) async {
    return await chatRepositoryImpl.blockUser(blockedUserId);
  }
}
