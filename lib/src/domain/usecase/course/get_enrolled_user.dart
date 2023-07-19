import 'package:dartz/dartz.dart';
import 'package:lms_pptik/src/data/repositories/course_repository_impl.dart';

import '../../../data/models/user_model.dart';
import '../../../utils/failures.dart';

class GetEnrolledUser {
  final CourseRepositoryImpl _courseRepositoryImpl;

  GetEnrolledUser(this._courseRepositoryImpl);

  Future<Either<Failure, List<UserModel>>> execute(int courseId) async {
    return await _courseRepositoryImpl.getEnrolledUser(courseId);
  }
}
