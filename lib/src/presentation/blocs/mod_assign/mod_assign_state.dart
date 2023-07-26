part of 'mod_assign_bloc.dart';

@freezed
class ModAssignState with _$ModAssignState {
  const factory ModAssignState.initial() = _Initial;

  const factory ModAssignState.loading() = _Loading;

  const factory ModAssignState.loaded(Object assignments) = _Loaded;

  const factory ModAssignState.error(String message) = _Error;
}
