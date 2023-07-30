import 'package:dartz/dartz.dart';

import '../../../data/repositories/user_repository_impl.dart';
import '../../../utils/failures.dart';

class UpdatePicture {
  final UserRepositoryImpl _userRepository;

  UpdatePicture(this._userRepository);

  Future<Either<Failure, bool>> execute(int itemId) async {
    return await _userRepository.updatePicture(itemId);
  }
}
