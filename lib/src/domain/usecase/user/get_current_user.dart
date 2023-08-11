part of 'user.dart';

class GetCurrentUser {
  final UserRepository _userRepository;

  GetCurrentUser(this._userRepository);

  Future<Either<Failure, UserModel>> call() async {
    return await _userRepository.getUser();
  }
}
