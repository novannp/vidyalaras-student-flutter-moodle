part of 'mod_assign.dart';

class GetSubmissionStatus {
  final ModAssignRepositoryImpl _modAssignmentRepositoryImpl;

  GetSubmissionStatus(this._modAssignmentRepositoryImpl);

  Future<Either<Failure, SubmissionStatusModel>> execute(int assignId) async {
    return await _modAssignmentRepositoryImpl.getSubmissionStatus(assignId);
  }
}
