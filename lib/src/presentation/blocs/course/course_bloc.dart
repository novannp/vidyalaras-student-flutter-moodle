import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lms_pptik/src/utils/helper/debounce.dart';

import '../../../data/models/course_model.dart';
import '../../../domain/usecase/course/course.dart';

part 'course_event.dart';
part 'course_state.dart';
part 'course_bloc.freezed.dart';

class GetRecentCourseBloc extends Bloc<CourseEvent, CourseState> {
  final GetRecentCourse _getRecentCourse;
  GetRecentCourseBloc(this._getRecentCourse)
      : super(const CourseState.initial()) {
    on<CourseEvent>((event, emit) async {
      await event.whenOrNull(getRecentCourse: () async {
        emit(const CourseState.loading());
        final result = await _getRecentCourse.execute();
        result.fold(
          (failure) => emit(CourseState.error(failure.message)),
          (data) => emit(CourseState.loaded(data)),
        );
      });
    });
  }
}

class GetFilteredCourseBloc extends Bloc<CourseEvent, CourseState> {
  final GetFilteredCourse _getFilteredCourse;
  GetFilteredCourseBloc(this._getFilteredCourse)
      : super(const CourseState.initial()) {
    on<CourseEvent>((event, emit) async {
      await event.whenOrNull(getFilteredCourse: (category) async {
        emit(const CourseState.loading());
        final result = await _getFilteredCourse.execute(category);
        result.fold(
          (failure) => emit(CourseState.error(failure.message)),
          (data) => emit(CourseState.loaded(data)),
        );
      });
    });
  }
}

class SearchCourseBloc extends Bloc<CourseEvent, CourseState> {
  final SearchCourse _searchCourse;

  SearchCourseBloc(this._searchCourse) : super(const CourseState.initial()) {
    on<CourseEvent>(
      (event, emit) async {
        await event.whenOrNull(searchCourse: (query) async {
          emit(const CourseState.loading());
          final result = await _searchCourse.execute(query);
          result.fold((l) {
            emit(CourseState.error(l.message));
          }, (r) {
            emit(CourseState.loaded(r));
          });
        });
      },
      transformer: debounce(const Duration(milliseconds: 500)),
    );
  }
}

class GetMateriBloc extends Bloc<CourseEvent, CourseState> {
  final GetMateri _getMateri;

  GetMateriBloc(this._getMateri) : super(const CourseState.initial()) {
    on<CourseEvent>(
      (event, emit) async {
        await event.whenOrNull(getMateri: (courseId) async {
          emit(const CourseState.loading());
          final result = await _getMateri.execute(courseId);
          result.fold((l) {
            emit(CourseState.error(l.message));
          }, (r) {
            emit(CourseState.loaded(r));
          });
        });
      },
    );
  }
}

class GetEnrolledUserBloc extends Bloc<CourseEvent, CourseState> {
  final GetEnrolledUser _getEnrolledUser;

  GetEnrolledUserBloc(this._getEnrolledUser)
      : super(const CourseState.initial()) {
    on<CourseEvent>(
      (event, emit) async {
        await event.whenOrNull(getEnrolledUser: (courseId) async {
          emit(const CourseState.loading());
          final result = await _getEnrolledUser.execute(courseId);
          result.fold((l) {
            emit(CourseState.error(l.message));
          }, (r) {
            emit(CourseState.loaded(r));
          });
        });
      },
    );
  }
}

class AddCourseToFavouriteBloc extends Bloc<CourseEvent, CourseState> {
  final AddCourseToFavourite _addCourseToFavourite;
  AddCourseToFavouriteBloc(this._addCourseToFavourite)
      : super(const CourseState.initial()) {
    on<CourseEvent>((event, emit) async {
      await event.whenOrNull(addCourseToFavorite: (course) async {
        emit(const CourseState.loading());
        final result = await _addCourseToFavourite.execute(course);
        result.fold((l) {
          emit(CourseState.error(l.message));
        }, (r) {
          emit(const CourseState.loadedWithoutData());
        });
      });
    });
  }
}
