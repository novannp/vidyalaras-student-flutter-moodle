part of 'course.dart';

class GetMateri {
  final CourseRepositoryImpl courseRepositoryImpl;

  GetMateri(this.courseRepositoryImpl);

  Future<Either<Failure, List<MateriModel>>> execute(int courseId) async {
    return await courseRepositoryImpl.getMateri(courseId);
  }
}
