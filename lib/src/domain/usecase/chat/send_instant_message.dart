import 'package:dartz/dartz.dart';
import 'package:lms_pptik/src/data/repositories/chat_repository_impl.dart';

import '../../../data/models/message_model.dart';
import '../../../utils/failures.dart';

class SendInstantMessage {
  final ChatRepositoryImpl _chatRepositoryImpl;

  SendInstantMessage(this._chatRepositoryImpl);

  Future<Either<Failure, Message>> execute(
      {required String message, required int receiverId}) async {
    return await _chatRepositoryImpl.sendInstantMessage(receiverId, message);
  }
}
