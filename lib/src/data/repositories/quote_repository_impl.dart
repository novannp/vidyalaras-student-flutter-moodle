import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:lms_pptik/src/data/models/tag_model.dart';

import 'package:lms_pptik/src/utils/failures.dart';

import '../../domain/repositories/quote_repository.dart';
import '../../utils/exceptions.dart';
import '../data_sources/quote_api.dart';
import '../models/quote_model.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  final QuoteApiImpl quoteApiImpl;

  QuoteRepositoryImpl(this.quoteApiImpl);

  @override
  Future<Either<Failure, QuoteModel>> getQuotes(String tag) async {
    try {
      final result = await quoteApiImpl.getQuoteByTag(tag);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure("Terjadi kesalahan pada server"));
    } on SocketException {
      return const Left(ConnectionFailure("Tidak ada koneksi internet"));
    }
  }

  @override
  Future<Either<Failure, List<TagModel>>> getTags() async {
    try {
      final result = await quoteApiImpl.getTags();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure("Terjadi kesalahan pada server"));
    } on SocketException {
      return const Left(ConnectionFailure("Tidak ada koneksi internet"));
    } on HandshakeException {
      return const Left(
          ConnectionFailure("Koneksi bermasalah silahkan coba lagi"));
    }
  }
}
