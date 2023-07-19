import 'package:dartz/dartz.dart';

import '../../../data/models/badge_model.dart';
import '../../../data/repositories/badge_repository_impl.dart';
import '../../../utils/failures.dart';

class GetBadge {
  final BadgeRepositoryImpl _badgeRepository;

  GetBadge(this._badgeRepository);

  Future<Either<Failure, List<BadgeModel>>> execute() async {
    return await _badgeRepository.getBadge();
  }
}
