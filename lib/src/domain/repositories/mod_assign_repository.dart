import 'package:dartz/dartz.dart';
import 'package:lms_pptik/src/data/models/submission_status_model.dart';
import 'package:lms_pptik/src/utils/failures.dart';

import '../../data/models/assignment_model.dart';

abstract class ModAssignRepository {
  Future<Either<Failure, List<AssignmentModel>>> getModAssignment(int courseId);

  Future<Either<Failure, SubmissionStatusModel>> getSubmissionStatus(
      int assignId);
}
