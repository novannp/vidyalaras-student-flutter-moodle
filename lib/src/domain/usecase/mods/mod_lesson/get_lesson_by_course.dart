part of 'mod_resource.dart';

class GetLessonByCourse {
  final ModLessonRepositoryImpl _modLessonRepository;

  GetLessonByCourse(this._modLessonRepository);

  Future<Either<Failure, List<Lesson>>> execute(int courseId) async {
    return await _modLessonRepository.getLessonByCourse(courseId);
  }
}
