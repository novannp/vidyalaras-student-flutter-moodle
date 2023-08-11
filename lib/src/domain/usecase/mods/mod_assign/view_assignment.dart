part of 'mod_assign.dart';

class ViewAssignment {
  final ModAssignRepository modAssignRepositoryImpl;

  ViewAssignment(this.modAssignRepositoryImpl);

  Future<Either<Failure, bool>> execute(int assignId) async {
    return await modAssignRepositoryImpl.viewAssignment(assignId);
  }
}
