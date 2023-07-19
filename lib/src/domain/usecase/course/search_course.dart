import 'package:dartz/dartz.dart';

import '../../../data/models/course_model.dart';
import '../../../data/repositories/course_repository_impl.dart';
import '../../../utils/failures.dart';

class SearchCourse {
  final CourseRepositoryImpl courseRepositoryImpl;

  SearchCourse(this.courseRepositoryImpl);

  Future<Either<Failure, List<CourseModel>>> execute(String query) async {
    return await courseRepositoryImpl.searchCourse(query);
  }
}
