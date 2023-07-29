part of 'mod_assign.dart';

class GetAssignmentList {
  final ModAssignRepositoryImpl _modAssignmentRepositoryImpl;

  GetAssignmentList(this._modAssignmentRepositoryImpl);

  Future<Either<Failure, List<AssignmentModel>>> execute(int courseId) async {
    return await _modAssignmentRepositoryImpl.getModAssignment(courseId);
  }
}
