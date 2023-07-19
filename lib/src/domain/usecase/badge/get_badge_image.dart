import 'package:lms_pptik/src/data/repositories/badge_repository_impl.dart';

import '../../../data/models/badge_model.dart';

class GetBadgeImage {
  final BadgeRepositoryImpl _badgeRepository;

  GetBadgeImage(this._badgeRepository);

  Future<String> execute(BadgeModel badge) async {
    return await _badgeRepository.getBadgeImage(badge);
  }
}
