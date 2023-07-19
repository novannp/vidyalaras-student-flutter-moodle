part of 'badge_bloc.dart';

@freezed
class BadgeState with _$BadgeState {
  const factory BadgeState.initial() = _Initial;
  const factory BadgeState.loading() = _Loading;
  const factory BadgeState.loaded(Object badges) = _Loaded;
  const factory BadgeState.error(String message) = _Error;
}
