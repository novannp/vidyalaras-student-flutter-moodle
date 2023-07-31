part of 'mod_assign_bloc.dart';

@freezed
class ModAssignEvent with _$ModAssignEvent {
  const factory ModAssignEvent.getAssignmentList(int courseId) =
      _GetAssignmentList;

  const factory ModAssignEvent.getSubmissionStatus(int assignId) =
      _GetSubmissionStatus;
  const factory ModAssignEvent.submitSubmission(int assignId, int itemId) =
      _SubmitSubmission;
  const factory ModAssignEvent.viewSubmission(int assignId) = _ViewSubmission;
}
