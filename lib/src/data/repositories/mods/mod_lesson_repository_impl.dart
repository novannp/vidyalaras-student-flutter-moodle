part of 'mods.dart';

class ModLessonRepositoryImpl implements ModLessonRepository{
  final ModLessonApiImpl _modLessonApi;
  final StorageHelper storage;

  ModLessonRepositoryImpl(this._modLessonApi, this.storage);

  @override
  Future<Either<Failure, List<Lesson>>> getLessonByCourse(int courseId)async {
    try {
      final token = await storage.read('token');
      final result =
          await _modLessonApi.getModLesson(token, courseId);
      return Right(result);
    } on SocketException {
      return const Left(ConnectionFailure("Tidak ada koneksi internet"));
    } on ServerException {
      return const Left(ServerFailure("Terjadi kesalahan pada server"));
    }
  }
}