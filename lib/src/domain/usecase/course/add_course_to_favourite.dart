part of 'course.dart';

class AddCourseToFavourite {
  final CourseRepositoryImpl _courseRepositoryImpl;

  AddCourseToFavourite(this._courseRepositoryImpl);

  Future<Either<Failure, void>> execute(CourseModel course) async {
    return await _courseRepositoryImpl.addCourseToFavorite(course);
  }
}
