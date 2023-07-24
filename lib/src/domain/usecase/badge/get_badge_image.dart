part of 'badge.dart';

class GetBadgeImage {
  final BadgeRepositoryImpl _badgeRepository;

  GetBadgeImage(this._badgeRepository);

  Future<String> execute(BadgeModel badge) async {
    return await _badgeRepository.getBadgeImage(badge);
  }
}
