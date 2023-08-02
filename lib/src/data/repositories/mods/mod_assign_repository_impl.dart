part of 'mods.dart';

class ModAssignRepositoryImpl implements ModAssignRepository {
  final ModAssignApiImpl modAssignApiImpl;
  final StorageHelper storage;

  ModAssignRepositoryImpl(this.modAssignApiImpl, this.storage);

  @override
  Future<Either<Failure, List<AssignmentModel>>> getModAssignment(
      int courseId) async {
    try {
      final token = await storage.read('token');
      final result = await modAssignApiImpl.getModAssignment(token, courseId);
      return Right(result);
    } on SocketException {
      return const Left(ConnectionFailure("Tidak ada koneksi internet"));
    } on ServerException {
      return const Left(ServerFailure("Terjadi kesalahan pada server"));
    }
  }

  @override
  Future<Either<Failure, SubmissionStatusModel>> getSubmissionStatus(
      int assignId) async {
    try {
      final token = await storage.read('token');
      final result =
          await modAssignApiImpl.getSubmissionStatus(token, assignId);
      return Right(result);
    } on SocketException {
      return const Left(ConnectionFailure("Tidak ada koneksi internet"));
    } on ServerException {
      return const Left(ServerFailure("Terjadi kesalahan pada server"));
    }
  }

  @override
  Future<Either<Failure, bool>> submitSubmission(
      int assignId, int itemId) async {
    try {
      final token = await storage.read('token');
      final result =
          await modAssignApiImpl.submitSubmission(token, assignId, itemId);
      return Right(result);
    } on SocketException {
      return const Left(ConnectionFailure("Tidak ada koneksi internet"));
    } on ServerException {
      return const Left(ServerFailure("Terjadi kesalahan pada server"));
    } catch (e) {
      if (e is NotFoundException) {
        return Left(ServerFailure(e.message!));
      } else {
        return const Left(ServerFailure("Terjadi kesalahan pada server"));
      }
    }
  }

  @override
  Future<Either<Failure, bool>> viewAssignment(int assignId) async {
    try {
      final token = await storage.read('token');
      final result = await modAssignApiImpl.viewAssignment(token, assignId);
      return Right(result);
    } on SocketException {
      return const Left(ConnectionFailure("Tidak ada koneksi internet"));
    } on ServerException {
      return const Left(ServerFailure("Terjadi kesalahan pada server"));
    }
  }
}
