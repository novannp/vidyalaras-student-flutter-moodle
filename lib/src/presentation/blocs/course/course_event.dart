part of 'course_bloc.dart';

@freezed
class CourseEvent with _$CourseEvent {
  const factory CourseEvent.getRecentCourse() = _GetRecentCourse;

  const factory CourseEvent.getFilteredCourse(String category) =
      _GetFilteredCourse;

  const factory CourseEvent.searchCourse(String query) = _SearchCourse;

  const factory CourseEvent.getMateri(int courseId) = _GetMateri;

  const factory CourseEvent.getEnrolledUser(int courseId) = _GetEnrolledUser;

  const factory CourseEvent.addCourseToFavorite(CourseModel course) =
      _AddCourseToFavorite;

  const factory CourseEvent.getUserGrade(int courseId) = _GetUserGrade;
}
