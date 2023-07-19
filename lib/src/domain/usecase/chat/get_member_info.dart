import 'package:dartz/dartz.dart';

import '../../../data/models/member_model.dart';
import '../../../data/repositories/chat_repository_impl.dart';
import '../../../utils/failures.dart';

class GetMemberInfo {
  final ChatRepositoryImpl chatRepositoryImpl;

  GetMemberInfo(this.chatRepositoryImpl);

  Future<Either<Failure, MemberModel>> execute(int memberId) async {
    return await chatRepositoryImpl.getMemberInfo(memberId);
  }
}
