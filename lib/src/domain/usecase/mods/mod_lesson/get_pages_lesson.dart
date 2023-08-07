part of 'mod_resource.dart';

class GetPagesLesson {
  final ModLessonRepositoryImpl _modLessonRepository;

  GetPagesLesson(this._modLessonRepository);

  Future<Either<Failure, List<PageLesson>>> execute(int lessonId) async {
    return await _modLessonRepository.getPages(lessonId);
  }


}