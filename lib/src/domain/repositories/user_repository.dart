import 'package:dartz/dartz.dart';

import '../../data/models/user_model.dart';
import '../../utils/failures.dart';

abstract class UserRepository {
  Future<Either<Failure, UserModel>> getUser();
}
