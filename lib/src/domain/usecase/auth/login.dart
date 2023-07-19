import 'package:dartz/dartz.dart';
import 'package:lms_pptik/src/data/repositories/auth_repository_impl.dart';

import '../../../utils/failures.dart';

class Login {
  final AuthRepositoryImpl authRepositoryImpl;

  Login(this.authRepositoryImpl);

  Future<Either<Failure, void>> execute(
      String username, String password) async {
    return await authRepositoryImpl.login(username, password);
  }
}
