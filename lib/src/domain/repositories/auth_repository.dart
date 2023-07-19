import 'package:dartz/dartz.dart';

import '../../utils/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> login(String username, String password);
  Future<Either<Failure, void>> logout();
}
