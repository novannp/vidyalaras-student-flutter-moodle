import 'package:dartz/dartz.dart';
import 'package:lms_pptik/src/data/repositories/user_repository_impl.dart';

import '../../../data/models/user_model.dart';
import '../../../utils/failures.dart';

class GetCurrentUser {
  final UserRepositoryImpl _userRepository;

  GetCurrentUser(this._userRepository);

  Future<Either<Failure, UserModel>> call() async {
    return await _userRepository.getUser();
  }
}
