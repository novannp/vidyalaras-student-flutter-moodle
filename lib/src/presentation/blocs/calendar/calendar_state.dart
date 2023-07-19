part of 'calendar_bloc.dart';

@freezed
class CalendarState with _$CalendarState {
  const factory CalendarState.initial() = _Initial;
  const factory CalendarState.loading() = _Loading;
  const factory CalendarState.loaded(Object data) = _Loaded;
  const factory CalendarState.error(String message) = _Error;
}
