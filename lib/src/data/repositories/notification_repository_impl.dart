import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/notification_repository.dart';
import '../../utils/exceptions.dart';
import '../../utils/failures.dart';
import '../../utils/helper/secure_storage/secure_storage.dart';
import '../data_sources/notification_api.dart';
import '../models/notification_model.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationApiImpl notificationApiImpl;
  final StorageHelper storageHelper;

  NotificationRepositoryImpl(this.notificationApiImpl, this.storageHelper);

  @override
  Future<Either<Failure, List<NotificationModel>>> getNotifications() async {
    try {
      final token = await storageHelper.read('token');
      final userId = await storageHelper.read('userId');
      final notifications =
          await notificationApiImpl.getNotifications(token, userId);
      return Right(notifications);
    } on ServerException {
      return const Left(ServerFailure('Gagal mendapatkan notifikasi'));
    } on SocketException {
      return const Left(ServerFailure('Tidak ada koneksi internet'));
    }
  }

  @override
  Future<Either<Failure, int>> getNotificationCount() async {
    try {
      final token = await storageHelper.read('token');
      final userId = await storageHelper.read('userId');
      final notificationCount = await notificationApiImpl.getNotificationCount(
          token, int.parse(userId));
      return Right(notificationCount);
    } on SocketException {
      return const Left(ServerFailure('Tidak ada koneksi internet'));
    } on ServerException {
      return const Left(ServerFailure('Gagal mendapatkan notifikasi'));
    }
  }

  @override
  Future<Either<Failure, bool>> markAllNotificationAsRead() async {
    try {
      final token = await storageHelper.read('token');
      final userId = await storageHelper.read('userId');
      final result = await notificationApiImpl.markNotificationAsRead(
          token, int.parse(userId));
      return Right(result);
    } on SocketException {
      return const Left(ServerFailure('Tidak ada koneksi internet'));
    } on ServerException {
      return const Left(ServerFailure('Gagal mendapatkan notifikasi'));
    }
  }
}
