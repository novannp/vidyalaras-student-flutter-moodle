part of 'course.dart';

class GetFilteredCourse {
  final CourseRepository courseRepositoryImpl;

  GetFilteredCourse(this.courseRepositoryImpl);

  Future<Either<Failure, List<CourseModel>>> execute(String category) async {
    return await courseRepositoryImpl.getFilteredCourse(category);
  }
}
