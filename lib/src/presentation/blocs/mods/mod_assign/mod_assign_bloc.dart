import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/usecase/mods/mod_assign/mod_assign.dart';
import '../mod_state.dart';

part 'mod_assign_event.dart';

part 'mod_assign_bloc.freezed.dart';

class GetAssignmentListBloc extends Bloc<ModAssignEvent, ModState> {
  final GetAssignmentList _getAssignmentList;

  GetAssignmentListBloc(this._getAssignmentList)
      : super(const ModState.initial()) {
    on<ModAssignEvent>((event, emit) async {
      await event.whenOrNull(
        getAssignmentList: (courseId) async {
          emit(const ModState.loading());
          final assignmentList = await _getAssignmentList.execute(courseId);
          assignmentList.fold(
            (failure) => emit(ModState.error(failure.message)),
            (assignmentList) => emit(ModState.loaded(assignmentList)),
          );
        },
      );
    });
  }
}

class GetSubmissionStatusBloc extends Bloc<ModAssignEvent, ModState> {
  final GetSubmissionStatus _getSubmissionStatus;

  GetSubmissionStatusBloc(this._getSubmissionStatus)
      : super(const ModState.initial()) {
    on<ModAssignEvent>((event, emit) async {
      await event.whenOrNull(
        getSubmissionStatus: (assignId) async {
          emit(const ModState.loading());
          final assignmentList = await _getSubmissionStatus.execute(assignId);
          assignmentList.fold(
            (failure) => emit(ModState.error(failure.message)),
            (assignmentList) => emit(ModState.loaded(assignmentList)),
          );
        },
      );
    });
  }
}

class SubmitSubmissionBloc extends Bloc<ModAssignEvent, ModState> {
  final SubmitSubmission _submitSubmission;

  SubmitSubmissionBloc(this._submitSubmission)
      : super(const ModState.initial()) {
    on<ModAssignEvent>((event, emit) async {
      await event.whenOrNull(
        submitSubmission: (assignId, itemId) async {
          emit(const ModState.loading());
          final result = await _submitSubmission.execute(assignId, itemId);
          result.fold(
            (failure) => emit(ModState.error(failure.message)),
            (result) => emit(ModState.loaded(result)),
          );
        },
      );
    });
  }
}

class ViewAssignmentBloc extends Bloc<ModAssignEvent, ModState> {
  final ViewAssignment _viewAssignment;

  ViewAssignmentBloc(this._viewAssignment) : super(const ModState.initial()) {
    on<ModAssignEvent>((event, emit) async {
      await event.whenOrNull(
        viewSubmission: (assignId) async {
          emit(const ModState.loading());
          final result = await _viewAssignment.execute(assignId);
          result.fold(
            (failure) => emit(ModState.error(failure.message)),
            (result) => emit(ModState.loaded(result)),
          );
        },
      );
    });
  }
}
