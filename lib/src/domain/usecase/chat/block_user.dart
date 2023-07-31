part of 'chat.dart';

class BlockUser {
  final ChatRepositoryImpl chatRepositoryImpl;

  BlockUser(this.chatRepositoryImpl);

  Future<Either<Failure, bool>> execute(int blockedUserId) async {
    return await chatRepositoryImpl.blockUser(blockedUserId);
  }
}
