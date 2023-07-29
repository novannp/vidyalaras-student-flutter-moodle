part of 'mods.dart';

class ModResourceRepositoryImpl implements ModResourceRepository {
  final ModResourceApiImpl modResourceApiImpl;
  final StorageHelper storage;

  ModResourceRepositoryImpl(this.modResourceApiImpl, this.storage);
  @override
  Future<Either<Failure, List<ResourceModel>>> getResourceByCourse(
      int courseId) async {
    try {
      final token = await storage.read('token');
      final result =
          await modResourceApiImpl.getResourceByCourse(token, courseId);
      return Right(result);
    } on SocketException {
      return const Left(ConnectionFailure("Tidak ada koneksi internet"));
    } on ServerException {
      return const Left(ServerFailure("Terjadi kesalahan pada server"));
    }
  }

  @override
  Future<Either<Failure, bool>> viewResource(int resourceId) async {
    try {
      final token = await storage.read('token');
      final result = await modResourceApiImpl.viewResource(token, resourceId);
      return Right(result);
    } on SocketException {
      return const Left(ConnectionFailure("Tidak ada koneksi internet"));
    } on ServerException {
      return const Left(ServerFailure("Terjadi kesalahan pada server"));
    }
  }
}
