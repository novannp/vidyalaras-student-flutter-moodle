part of 'course.dart';

class GetFilteredCourse {
  final CourseRepositoryImpl courseRepositoryImpl;

  GetFilteredCourse(this.courseRepositoryImpl);

  Future<Either<Failure, List<CourseModel>>> execute(String category) async {
    return await courseRepositoryImpl.getFilteredCourse(category);
  }
}
