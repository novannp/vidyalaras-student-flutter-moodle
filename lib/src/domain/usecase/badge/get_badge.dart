part of 'badge.dart';

class GetBadge {
  final BadgeRepositoryImpl _badgeRepository;

  GetBadge(this._badgeRepository);

  Future<Either<Failure, List<BadgeModel>>> execute() async {
    return await _badgeRepository.getBadge();
  }
}
