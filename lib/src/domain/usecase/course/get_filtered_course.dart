import 'package:dartz/dartz.dart';

import '../../../data/models/course_model.dart';
import '../../../data/repositories/course_repository_impl.dart';
import '../../../utils/failures.dart';

class GetFilteredCourse {
  final CourseRepositoryImpl courseRepositoryImpl;

  GetFilteredCourse(this.courseRepositoryImpl);

  Future<Either<Failure, List<CourseModel>>> execute(String category) async {
    return await courseRepositoryImpl.getFilteredCourse(category);
  }
}
