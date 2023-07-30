part of 'mod_assign.dart';

class SubmitSubmission {
  final ModAssignRepositoryImpl _modAssignmentRepositoryImpl;

  SubmitSubmission(this._modAssignmentRepositoryImpl);

  Future<Either<Failure, bool>> execute(int assignId, int itemId) async {
    return await _modAssignmentRepositoryImpl.submitSubmission(
        assignId, itemId);
  }
}
