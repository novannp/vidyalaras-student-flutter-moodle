import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:lms_pptik/src/data/models/badge_model/badge_model.dart';
import 'package:lms_pptik/src/utils/failures.dart';

import '../../domain/repositories/badge_repository.dart';
import '../../utils/exceptions.dart';
import '../../utils/helper/secure_storage/secure_storage.dart';
import '../data_sources/badge_api.dart';

class BadgeRepositoryImpl implements BadgeRepository {
  final BadgeApiImpl badgeApi;
  final StorageHelper storage;

  BadgeRepositoryImpl(this.badgeApi, this.storage);

  @override
  Future<Either<Failure, List<BadgeModel>>> getBadge() async {
    try {
      final token = await storage.read('token');
      final result = await badgeApi.getBadge(token);
      return Right(result);
    } on SocketException {
      return const Left(ServerFailure('Tidak ada koneksi internet'));
    } on ServerException {
      return const Left(ServerFailure('Server sedang bermasalah'));
    }
  }

  @override
  Future<String> getBadgeImage(BadgeModel badge) async {
    final token = await storage.read('token');
    final result = await badgeApi.getBadgeImage(token, badge);
    return result;
  }
}
