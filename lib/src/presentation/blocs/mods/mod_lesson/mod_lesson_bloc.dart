import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lms_pptik/src/domain/usecase/mods/mod_lesson/mod_resource.dart';
import 'package:lms_pptik/src/presentation/blocs/mods/mod_state.dart';

part 'mod_lesson_event.dart';

part 'mod_lesson_bloc.freezed.dart';

class GetLessonByCourseBloc extends Bloc<ModLessonEvent, ModState> {
  final GetLessonByCourse _getLessonByCourse;

  GetLessonByCourseBloc(this._getLessonByCourse)
      : super(const ModState.initial()) {
    on<ModLessonEvent>((event, emit) async {
      await event.whenOrNull(getLessonByCourse: (courseId) async {
        emit(const ModState.loading());
        final lessonList = await _getLessonByCourse.execute(courseId);
        lessonList.fold(
          (failure) => emit(ModState.error(failure.message)),
          (lessonList) => emit(ModState.loaded(lessonList)),
        );
      });
    });
  }
}

class GetLessonBloc extends Bloc<ModLessonEvent, ModState> {
  final GetLesson _getLesson;

  GetLessonBloc(this._getLesson) : super(const ModState.initial()) {
    on<ModLessonEvent>((event, emit) async {
      await event.whenOrNull(getLesson: (lessonId) async {
        emit(const ModState.loading());
        final lesson = await _getLesson.execute(lessonId);
        lesson.fold(
          (failure) => emit(ModState.error(failure.message)),
          (lesson) => emit(ModState.loaded(lesson)),
        );
      });
    });
  }
}

class GetPagesLessonBloc extends Bloc<ModLessonEvent, ModState> {
  final GetPagesLesson _getPagesLesson;

  GetPagesLessonBloc(this._getPagesLesson) : super(const ModState.initial()) {
    on<ModLessonEvent>((event, emit) async {
      await event.whenOrNull(getPagesLesson: (lessonId) async {
        emit(const ModState.loading());
        final result = await _getPagesLesson.execute(lessonId);
        result.fold(
          (error) => emit(ModState.error(error.message)),
          (data) => emit(ModState.loaded(data)),
        );
      });
    });
  }
}
