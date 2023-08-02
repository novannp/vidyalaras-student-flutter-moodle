part of 'completion_bloc.dart';

@freezed
class CompletionState with _$CompletionState {
  const factory CompletionState.initial() = _Initial;
  const factory CompletionState.loading() = _Loading;
  const factory CompletionState.loaded(Object? data) = _Loaded;
  const factory CompletionState.error(String message) = _Error;
}
