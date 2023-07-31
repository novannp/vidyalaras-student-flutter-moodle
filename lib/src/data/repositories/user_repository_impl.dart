import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:lms_pptik/src/utils/failures.dart';
import 'package:lms_pptik/src/utils/helper/notification_plugin/notification_plugin.dart';

import '../../domain/repositories/user_repository.dart';
import '../../utils/exceptions.dart';
import '../../utils/helper/secure_storage/secure_storage.dart';
import '../data_sources/user_api.dart';
import '../models/user_model/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApiImpl userApi;
  final StorageHelper storage;
  final NotificationPlugin notificationPlugin;

  UserRepositoryImpl(this.userApi, this.storage, this.notificationPlugin);

  @override
  Future<Either<Failure, UserModel>> getUser() async {
    try {
      final token = await storage.read('token');
      final username = await storage.read('username');
      final user = await userApi.getUser(username.replaceAll(' ', ''), token);
      notificationPlugin.showWelcomeNotification(user.fullname!);
      await storage.write('userId', user.id.toString());
      return Right(user);
    } on SocketException {
      return const Left(ConnectionFailure('Tidak ada koneksi internet'));
    } on NotFoundException {
      return const Left(ServerFailure('User tidak ditemukan'));
    }
  }

  @override
  Future<Either<Failure, bool>> updatePicture(int itemId) async {
    try {
      final token = await storage.read('token');
      final result = await userApi.updatePicture(token, itemId);
      return Right(result);
    } on SocketException {
      return const Left(ConnectionFailure('Tidak ada koneksi internet'));
    } on ServerException {
      return const Left(ServerFailure('Tidak dapat mengupload file'));
    }
  }
}
