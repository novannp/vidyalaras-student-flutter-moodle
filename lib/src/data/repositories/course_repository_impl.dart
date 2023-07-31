import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:lms_pptik/src/data/models/course_model.dart';
import 'package:lms_pptik/src/domain/repositories/course_repository.dart';
import 'package:lms_pptik/src/utils/exceptions.dart';
import 'package:lms_pptik/src/utils/failures.dart';

import '../../utils/helper/secure_storage/secure_storage.dart';
import '../data_sources/course_api.dart';
import '../models/materi_model/materi_model.dart';
import '../models/user_grade_model/user_grade_model.dart';
import '../models/user_model/user_model.dart';

class CourseRepositoryImpl implements CourseRepository {
  final CourseApiImpl courseApiImpl;
  final StorageHelper storage;

  CourseRepositoryImpl(this.courseApiImpl, this.storage);

  @override
  Future<Either<Failure, List<CourseModel>>> getRecentCourse() async {
    try {
      final token = await storage.read('token');
      final result = await courseApiImpl.getRecentCourse(token);
      return Right(result);
    } on SocketException {
      return const Left(ConnectionFailure("Tidak ada koneksi internet"));
    } on ServerException {
      return const Left(ServerFailure("Terjadi kesalahan pada server"));
    }
  }

  @override
  Future<Either<Failure, List<CourseModel>>> getFilteredCourse(
      String category) async {
    try {
      final token = await storage.read('token');
      final result = await courseApiImpl.getFilteredCourse(token, category);
      return Right(result);
    } on SocketException {
      return const Left(ConnectionFailure("Tidak ada koneksi internet"));
    } on ServerException {
      return const Left(ServerFailure("Terjadi kesalahan pada server"));
    }
  }

  @override
  Future<Either<Failure, List<CourseModel>>> searchCourse(String query) async {
    try {
      final token = await storage.read('token');
      final result = await courseApiImpl.searchCourse(token, query);
      return Right(result);
    } on SocketException {
      return const Left(ConnectionFailure("Tidak ada koneksi internet"));
    } on ServerException {
      return const Left(ServerFailure("Terjadi kesalahan pada server"));
    }
  }

  @override
  Future<Either<Failure, List<MateriModel>>> getMateri(int courseId) async {
    try {
      final token = await storage.read('token');
      final result = await courseApiImpl.getMateri(token, courseId);
      return Right(result);
    } on SocketException {
      return const Left(ConnectionFailure("Tidak ada koneksi internet"));
    } on ServerException {
      return const Left(ServerFailure("Terjadi kesalahan pada server"));
    }
  }

  @override
  Future<Either<Failure, List<UserModel>>> getEnrolledUser(int courseId) async {
    try {
      final token = await storage.read('token');
      final result = await courseApiImpl.getEnrolledUser(token, courseId);
      return Right(result);
    } on SocketException {
      return const Left(ConnectionFailure("Tidak ada koneksi internet"));
    } on ServerException {
      return const Left(ServerFailure("Terjadi kesalahan pada server"));
    }
  }

  @override
  Future<Either<Failure, void>> addCourseToFavorite(CourseModel course) async {
    try {
      final token = await storage.read('token');
      final result = await courseApiImpl.addCourseToFavorite(token, course);
      return Right(result);
    } on SocketException {
      return const Left(ConnectionFailure("Tidak ada koneksi internet"));
    } on ServerException {
      return const Left(ServerFailure("Terjadi kesalahan pada server"));
    }
  }

  @override
  Future<Either<Failure, List<UserGradeModel>>> getUserGrade(
      int courseId) async {
    try {
      final token = await storage.read('token');
      final userId = await storage.read('userId');
      final result =
          await courseApiImpl.getUserGrade(token, courseId, int.parse(userId));
      return Right(result);
    } on SocketException {
      return const Left(ConnectionFailure("Tidak ada koneksi internet"));
    } on ServerException {
      return const Left(ServerFailure("Terjadi kesalahan pada server"));
    }
  }
}
