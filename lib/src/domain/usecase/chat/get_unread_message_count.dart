part of 'chat.dart';

class GetUnreadMessageCount {
  final ChatRepository chatRepositoryImpl;

  GetUnreadMessageCount(this.chatRepositoryImpl);

  Future<Either<Failure, int>> execute() async {
    return await chatRepositoryImpl.getUnreadMessageCount();
  }
}
