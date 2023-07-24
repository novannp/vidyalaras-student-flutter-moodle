part of 'chat.dart';

class SendInstantMessage {
  final ChatRepositoryImpl _chatRepositoryImpl;

  SendInstantMessage(this._chatRepositoryImpl);

  Future<Either<Failure, Message>> execute(
      {required String message, required int receiverId}) async {
    return await _chatRepositoryImpl.sendInstantMessage(receiverId, message);
  }
}
