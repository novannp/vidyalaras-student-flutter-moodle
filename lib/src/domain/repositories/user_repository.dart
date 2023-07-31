import 'package:dartz/dartz.dart';

import '../../data/models/user_model/user_model.dart';
import '../../utils/failures.dart';

abstract class UserRepository {
  Future<Either<Failure, UserModel>> getUser();
  Future<Either<Failure, bool>> updatePicture(int itemId);
}
