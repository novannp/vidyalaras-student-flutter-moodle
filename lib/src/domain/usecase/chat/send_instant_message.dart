part of 'chat.dart';

class SendInstantMessage {
  final ChatRepository _chatRepositoryImpl;

  SendInstantMessage(this._chatRepositoryImpl);

  Future<Either<Failure, SendMessageModel>> execute(
      {required String message, required int receiverId}) async {
    return await _chatRepositoryImpl.sendInstantMessage(receiverId, message);
  }
}
