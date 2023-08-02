import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:lms_pptik/src/data/models/event_model.dart';
import 'package:lms_pptik/src/utils/exceptions.dart';
import 'package:lms_pptik/src/utils/failures.dart';

import '../../domain/repositories/calendar_repository.dart';
import '../../utils/helper/secure_storage/secure_storage.dart';
import '../data_sources/calendar_api.dart';

class CalendarRepositoryImpl implements CalendarRepository {
  final CalendarApiImpl calendarApi;
  final StorageHelper storage;

  CalendarRepositoryImpl(this.calendarApi, this.storage);
  @override
  Future<Either<Failure, List<EventModel>>> getAllEvent() async {
    try {
      final token = await storage.read('token');
      final result = await calendarApi.getAllEvent(token);
      return Right(result);
    } on SocketException {
      return const Left(ServerFailure('Tidak ada koneksi internet'));
    } on ServerException {
      return const Left(ServerFailure('Server sedang bermasalah'));
    }
  }

  @override
  Future<Either<Failure, bool>> addEvent(EventModel event, int repeat) async {
    try {
      final token = await storage.read('token');
      final result = await calendarApi.addEvent(token, event, repeat);
      return Right(result);
    } on SocketException {
      return const Left(ServerFailure('Tidak ada koneksi internet'));
    } on ServerException {
      return const Left(ServerFailure('Server sedang bermasalah'));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteEvent(
      int eventId, bool deleteAllRepeated) async {
    try {
      final token = await storage.read('token');
      final result =
          await calendarApi.deleteEvent(token, eventId, deleteAllRepeated);
      return Right(result);
    } on SocketException {
      return const Left(ServerFailure('Tidak ada koneksi internet'));
    } on ServerException {
      return const Left(ServerFailure('Server sedang bermasalah'));
    }
  }
}
