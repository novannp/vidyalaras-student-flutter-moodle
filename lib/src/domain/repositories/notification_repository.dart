import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:lms_pptik/src/utils/exceptions.dart';
import 'package:lms_pptik/src/utils/helper/secure_storage/secure_storage.dart';

import '../../data/data_sources/notification_api.dart';
import '../../data/models/notification_model.dart';
import '../../utils/failures.dart';

abstract class NotificationRepository {
  Future<Either<Failure, List<NotificationModel>>> getNotifications();
}

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
}
