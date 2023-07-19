import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:lms_pptik/src/domain/repositories/auth_repository.dart';
import 'package:lms_pptik/src/utils/exceptions.dart';
import 'package:lms_pptik/src/utils/failures.dart';

import '../../utils/helper/secure_storage/secure_storage.dart';
import '../data_sources/auth_api.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiImpl authApi;
  final StorageHelper storage;
  AuthRepositoryImpl(this.authApi, this.storage);
  @override
  Future<Either<Failure, String>> login(
      String username, String password) async {
    try {
      final token = await authApi.login(username, password);
      await storage.write('token', token);
      await storage.write('username', username);
      return Right(token);
    } on AuthException {
      return const Left(LoginFailure('Username atau password salah'));
    } on ServerException {
      return const Left(ServerFailure('Server sedang bermasalah'));
    } on SocketException {
      return const Left(ServerFailure('Tidak ada koneksi internet'));
    } catch (e) {
      return const Left(ServerFailure('Terjadi kesalahan'));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await storage.delete('token');
      await storage.delete('username');
      return const Right(null);
    } on ServerException {
      return const Left(ServerFailure('Server sedang bermasalah'));
    } on SocketException {
      return const Left(ServerFailure('Tidak ada koneksi internet'));
    } catch (e) {
      return const Left(ServerFailure('Terjadi kesalahan'));
    }
  }
}
