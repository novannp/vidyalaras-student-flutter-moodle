part of 'course.dart';

class GetRecentCourse {
  final CourseRepositoryImpl courseRepositoryImpl;

  GetRecentCourse(this.courseRepositoryImpl);

  Future<Either<Failure, List<CourseModel>>> execute() async {
    return await courseRepositoryImpl.getRecentCourse();
  }
}
