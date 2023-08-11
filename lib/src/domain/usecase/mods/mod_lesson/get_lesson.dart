part of 'mod_resource.dart';

class GetLesson {
  final ModLessonRepository _modLessonRepository;

  GetLesson(this._modLessonRepository);

  Future<Either<Failure, Lesson>> execute(int lessonId) async {
    return await _modLessonRepository.getLesson(lessonId);
  }
}
