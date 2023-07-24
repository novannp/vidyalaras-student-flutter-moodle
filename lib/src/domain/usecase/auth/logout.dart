part of 'auth.dart';

class Logout {
  final AuthRepositoryImpl authRepositoryImpl;

  Logout(this.authRepositoryImpl);

  Future<Either<Failure, void>> execute() async {
    return await authRepositoryImpl.logout();
  }
}
