part of 'chat.dart';

class UnblockUser {
  final ChatRepositoryImpl chatRepositoryImpl;

  UnblockUser(this.chatRepositoryImpl);

  Future<Either<Failure, bool>> execute(int unblockUserId) async {
    return await chatRepositoryImpl.unblockUser(unblockUserId);
  }
}
