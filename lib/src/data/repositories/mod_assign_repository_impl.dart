import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:lms_pptik/src/data/models/submission_status_model.dart';
import 'package:lms_pptik/src/domain/repositories/mod_assign_repository.dart';
import 'package:lms_pptik/src/utils/exceptions.dart';
import 'package:lms_pptik/src/utils/failures.dart';

import '../../utils/helper/secure_storage/secure_storage.dart';
import '../data_sources/mod_apis/mod_apis.dart';
import '../models/assignment/assignment.dart';

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
}
