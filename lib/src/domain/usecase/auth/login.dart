part of 'auth.dart';

class Login {
  final AuthRepositoryImpl authRepositoryImpl;

  Login(this.authRepositoryImpl);

  Future<Either<Failure, void>> execute(
      String username, String password) async {
    return await authRepositoryImpl.login(username, password);
  }
}
