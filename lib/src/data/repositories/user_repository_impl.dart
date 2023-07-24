import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:lms_pptik/src/data/models/user_model.dart';

import 'package:lms_pptik/src/utils/failures.dart';
import 'package:lms_pptik/src/utils/helper/notification_plugin/notification_plugin.dart';

import '../../domain/repositories/user_repository.dart';
import '../../utils/exceptions.dart';
import '../../utils/helper/secure_storage/secure_storage.dart';
import '../data_sources/user_api.dart';

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
      final user = await userApi.getUser(username, token);
      notificationPlugin.showWelcomeNotification(user.name!);
      await storage.write('userId', user.id.toString());
      return Right(user);
    } on SocketException {
      return const Left(ConnectionFailure('Tidak ada koneksi internet'));
    } on NotFoundException {
      return const Left(ServerFailure('User tidak ditemukan'));
    } catch (e) {
      return const Left(ServerFailure('Terjadi kesalahan'));
    }
  }
}
