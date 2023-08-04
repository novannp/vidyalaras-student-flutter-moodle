part of 'mod_lesson_bloc.dart';

@freezed
class ModLessonEvent with _$ModLessonEvent {
  const factory ModLessonEvent.getLessonByCourse(int courseId) =
  _GetLessonByCourse;

  const factory ModLessonEvent.getLesson(int lessonId) =
  _GetLesson;
}
