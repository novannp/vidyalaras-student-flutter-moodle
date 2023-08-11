part of 'course.dart';

class SearchCourse {
  final CourseRepository courseRepositoryImpl;

  SearchCourse(this.courseRepositoryImpl);

  Future<Either<Failure, List<CourseModel>>> execute(String query) async {
    return await courseRepositoryImpl.searchCourse(query);
  }
}
