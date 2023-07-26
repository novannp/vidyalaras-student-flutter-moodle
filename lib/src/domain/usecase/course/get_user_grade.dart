part of 'course.dart';

class GetUserGrade {
  final CourseRepositoryImpl _courseRepositoryImpl;

  GetUserGrade(this._courseRepositoryImpl);

  Future<Either<Failure, List<UserGradeModel>>> execute(int courseId) async {
    return await _courseRepositoryImpl.getUserGrade(courseId);
  }
}
