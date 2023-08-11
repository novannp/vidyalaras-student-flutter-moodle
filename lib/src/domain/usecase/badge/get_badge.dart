part of 'badge.dart';

class GetBadge {
  final BadgeRepository _badgeRepository;

  GetBadge(this._badgeRepository);

  Future<Either<Failure, List<BadgeModel>>> execute() async {
    return await _badgeRepository.getBadge();
  }
}
