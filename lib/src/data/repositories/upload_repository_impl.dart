import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/upload_repository.dart';
import '../../utils/exceptions.dart';
import '../../utils/failures.dart';
import '../../utils/helper/secure_storage/secure_storage.dart';
import '../data_sources/upload_api.dart';
import '../models/item_model.dart';

class UploadRepositoryImpl implements UploadRepository {
  final UploadApiImpl uploadApiImpl;
  final StorageHelper storage;

  UploadRepositoryImpl(this.uploadApiImpl, this.storage);
  @override
  Future<Either<Failure, List<ItemModel>>> uploadFile(File file) async {
    try {
      final token = await storage.read('token');
      final result = await uploadApiImpl.uploadFile(token, file);
      return Right(result);
    } on SocketException {
      return const Left(ConnectionFailure('Tidak ada koneksi internet'));
    } on ServerException {
      return const Left(ServerFailure('Tidak dapat mengupload file'));
    }
  }
}
