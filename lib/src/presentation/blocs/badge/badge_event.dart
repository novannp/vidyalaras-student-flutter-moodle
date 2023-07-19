part of 'badge_bloc.dart';

@freezed
class BadgeEvent with _$BadgeEvent {
  const factory BadgeEvent.getBadge() = _GetBadge;
  const factory BadgeEvent.getBadgeImage(BadgeModel badge) = _GetBadgeImage;
}
