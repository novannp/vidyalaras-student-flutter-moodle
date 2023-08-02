import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lms_pptik/src/domain/usecase/completion/completion.dart';

part 'completion_event.dart';
part 'completion_state.dart';
part 'completion_bloc.freezed.dart';

class SelfCompletionBloc extends Bloc<CompletionEvent, CompletionState> {
  final SelfCompletion _selfCompletion;
  SelfCompletionBloc(this._selfCompletion)
      : super(const CompletionState.initial()) {
    on<CompletionEvent>((event, emit) async {
      await event.whenOrNull(
        selfCompletion: (cmId, completed) async {
          emit(const CompletionState.loading());
          final result = await _selfCompletion.execute(cmId, completed);
          result.fold(
            (failure) => emit(CompletionState.error(failure.message)),
            (data) => emit(CompletionState.loaded(data)),
          );
        },
      );
    });
  }
}
