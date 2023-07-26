import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lms_pptik/src/domain/usecase/mod_assign/mod_assign.dart';
import 'package:lms_pptik/src/domain/usecase/mod_assign/mod_assign.dart';

part 'mod_assign_event.dart';

part 'mod_assign_state.dart';

part 'mod_assign_bloc.freezed.dart';

class GetAssignmentListBloc extends Bloc<ModAssignEvent, ModAssignState> {
  final GetAssignmentList _getAssignmentList;

  GetAssignmentListBloc(this._getAssignmentList)
      : super(const ModAssignState.initial()) {
    on<ModAssignEvent>((event, emit) async {
      await event.whenOrNull(
        getAssignmentList: (courseId) async {
          emit(const ModAssignState.loading());
          final assignmentList = await _getAssignmentList.execute(courseId);
          assignmentList.fold(
            (failure) => emit(ModAssignState.error(failure.message)),
            (assignmentList) => emit(ModAssignState.loaded(assignmentList)),
          );
        },
      );
    });
  }
}

class GetSubmissionStatusBloc extends Bloc<ModAssignEvent, ModAssignState> {
  final GetSubmissionStatus _getSubmissionStatus;

  GetSubmissionStatusBloc(this._getSubmissionStatus)
      : super(const ModAssignState.initial()) {
    on<ModAssignEvent>((event, emit) async {
      await event.whenOrNull(
        getSubmissionStatus: (assignId) async {
          emit(const ModAssignState.loading());
          final assignmentList = await _getSubmissionStatus.execute(assignId);
          assignmentList.fold(
            (failure) => emit(ModAssignState.error(failure.message)),
            (assignmentList) => emit(ModAssignState.loaded(assignmentList)),
          );
        },
      );
    });
  }
}
