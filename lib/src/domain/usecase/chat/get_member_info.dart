part of 'chat.dart';

class GetMemberInfo {
  final ChatRepositoryImpl chatRepositoryImpl;

  GetMemberInfo(this.chatRepositoryImpl);

  Future<Either<Failure, MemberModel>> execute(int memberId) async {
    return await chatRepositoryImpl.getMemberInfo(memberId);
  }
}
