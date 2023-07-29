import 'package:freezed_annotation/freezed_annotation.dart';

part 'mod_state.freezed.dart';

@freezed
class ModState with _$ModState {
  const factory ModState.initial() = _Initial;

  const factory ModState.loading() = _Loading;

  const factory ModState.loaded(Object data) = _Loaded;

  const factory ModState.error(String message) = _Error;
}
