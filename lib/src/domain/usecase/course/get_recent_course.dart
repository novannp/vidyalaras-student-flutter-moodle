import 'package:dartz/dartz.dart';
import 'package:lms_pptik/src/data/models/course_model.dart';
import 'package:lms_pptik/src/data/repositories/course_repository_impl.dart';

import '../../../utils/failures.dart';

class GetRecentCourse {
  final CourseRepositoryImpl courseRepositoryImpl;

  GetRecentCourse(this.courseRepositoryImpl);

  Future<Either<Failure, List<CourseModel>>> execute() async {
    return await courseRepositoryImpl.getRecentCourse();
  }
}
