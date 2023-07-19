import 'package:dartz/dartz.dart';

import '../../../data/models/course_model.dart';
import '../../../data/repositories/course_repository_impl.dart';
import '../../../utils/failures.dart';

class AddCourseToFavourite {
  final CourseRepositoryImpl _courseRepositoryImpl;

  AddCourseToFavourite(this._courseRepositoryImpl);

  Future<Either<Failure, void>> execute(CourseModel course) async {
    return await _courseRepositoryImpl.addCourseToFavorite(course);
  }
}
