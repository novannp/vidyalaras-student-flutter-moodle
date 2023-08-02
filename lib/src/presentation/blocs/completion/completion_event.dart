part of 'completion_bloc.dart';

@freezed
class CompletionEvent with _$CompletionEvent {
  const factory CompletionEvent.selfCompletion(int cmId, int completed) =
      _SelfCompletion;
}
