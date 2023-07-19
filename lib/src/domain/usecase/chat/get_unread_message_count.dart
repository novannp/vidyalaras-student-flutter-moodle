import 'package:dartz/dartz.dart';

import '../../../data/repositories/chat_repository_impl.dart';
import '../../../utils/failures.dart';

class GetUnreadMessageCount {
  final ChatRepositoryImpl chatRepositoryImpl;

  GetUnreadMessageCount(this.chatRepositoryImpl);

  Future<Either<Failure, int>> execute() async {
    return await chatRepositoryImpl.getUnreadMessageCount();
  }
}
