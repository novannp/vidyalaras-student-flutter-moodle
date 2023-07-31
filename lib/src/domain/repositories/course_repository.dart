import 'package:dartz/dartz.dart';
import 'package:lms_pptik/src/data/models/course_model.dart';

import '../../data/models/materi_model/materi_model.dart';
import '../../data/models/user_grade_model/user_grade_model.dart';
import '../../data/models/user_model.dart';
import '../../utils/failures.dart';

abstract class CourseRepository {
  Future<Either<Failure, List<CourseModel>>> getRecentCourse();

  Future<Either<Failure, List<CourseModel>>> getFilteredCourse(String category);

  Future<Either<Failure, List<CourseModel>>> searchCourse(String query);

  Future<Either<Failure, List<MateriModel>>> getMateri(int courseId);

  Future<Either<Failure, List<UserModel>>> getEnrolledUser(int courseId);

  Future<Either<Failure, void>> addCourseToFavorite(CourseModel course);

  Future<Either<Failure, List<UserGradeModel>>> getUserGrade(int courseId);
}
