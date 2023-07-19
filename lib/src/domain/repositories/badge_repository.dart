import 'package:dartz/dartz.dart';

import '../../data/models/badge_model.dart';
import '../../utils/failures.dart';

abstract class BadgeRepository {
  Future<Either<Failure, List<BadgeModel>>> getBadge();
  Future<String> getBadgeImage(BadgeModel badge);
}
