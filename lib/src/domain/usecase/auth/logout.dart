import 'package:dartz/dartz.dart';

import '../../../data/repositories/auth_repository_impl.dart';
import '../../../utils/failures.dart';

class Logout {
  final AuthRepositoryImpl authRepositoryImpl;

  Logout(this.authRepositoryImpl);

  Future<Either<Failure, void>> execute() async {
    return await authRepositoryImpl.logout();
  }
}
