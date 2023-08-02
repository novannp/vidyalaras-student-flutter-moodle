import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:lms_pptik/src/data/data_sources/completion_api.dart';

import 'package:lms_pptik/src/utils/failures.dart';

import '../../domain/repositories/completion_repository.dart';
import '../../utils/exceptions.dart';
import '../../utils/helper/secure_storage/secure_storage.dart';

class CompletionRepositoryImpl implements CompletionRepository {
  final StorageHelper storage;
  final CompletionApiImpl completionApi;
  CompletionRepositoryImpl(this.storage, this.completionApi);

  @override
  Future<Either<Failure, bool>> setCompletionStatus(
      int cmId, int completed) async {
    try {
      final token = await storage.read('token');
      final result =
          await completionApi.setCompletionStatus(token, cmId, completed);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('Server sedang bermasalah'));
    } on SocketException {
      return const Left(ConnectionFailure('Tidak ada koneksi internet'));
    }
  }
}
