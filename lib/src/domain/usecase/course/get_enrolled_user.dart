part of 'course.dart';

class GetEnrolledUser {
  final CourseRepositoryImpl _courseRepositoryImpl;

  GetEnrolledUser(this._courseRepositoryImpl);

  Future<Either<Failure, List<UserModel>>> execute(int courseId) async {
    return await _courseRepositoryImpl.getEnrolledUser(courseId);
  }
}
