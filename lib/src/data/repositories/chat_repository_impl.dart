import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:lms_pptik/src/data/models/member_model.dart';
import 'package:lms_pptik/src/utils/exceptions.dart';

import 'package:lms_pptik/src/utils/failures.dart';

import '../../domain/repositories/chat_repository.dart';
import '../../utils/helper/secure_storage/secure_storage.dart';

import '../data_sources/chat_api.dart';
import '../models/chat_model/chat_model.dart';
import '../models/chat_model/send_message_model.dart';
import '../models/conversation_model/conversation.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatApiImpl chatApiImpl;
  final StorageHelper storage;

  ChatRepositoryImpl(this.chatApiImpl, this.storage);

  @override
  Future<Either<Failure, List<ConversationModel>>> getConversations() async {
    try {
      final token = await storage.read('token');
      final userId = await storage.read('userId');
      final result =
          await chatApiImpl.getConversations(token, int.parse(userId));
      return Right(result);
    } on SocketException {
      return const Left(ConnectionFailure("Tidak ada koneksi internet"));
    } on ServerException {
      return const Left(ServerFailure("Terjadi kesalahan pada server"));
    }
  }

  @override
  Future<Either<Failure, ChatModel>> getConversationMessage(
      int conversationId) async {
    try {
      final token = await storage.read('token');
      final userId = await storage.read('userId');
      final result = await chatApiImpl.getConversationMessage(
          token, int.parse(userId), conversationId);
      return Right(result);
    } on SocketException {
      return const Left(ConnectionFailure("Tidak ada koneksi internet"));
    } on ServerException {
      return const Left(ServerFailure("Terjadi kesalahan pada server"));
    }
  }

  @override
  Future<Either<Failure, MemberModel>> getMemberInfo(int memberId) async {
    try {
      final token = await storage.read('token');
      final userId = await storage.read('userId');
      final result =
          await chatApiImpl.getMemberInfo(token, int.parse(userId), memberId);
      return Right(result);
    } on SocketException {
      return const Left(ConnectionFailure("Tidak ada koneksi internet"));
    } on ServerException {
      return const Left(ServerFailure("Terjadi kesalahan pada server"));
    }
  }

  @override
  Future<Either<Failure, SendMessageModel>> sendInstantMessage(
      int toUserId, String message) async {
    try {
      final token = await storage.read('token');
      final result =
          await chatApiImpl.sendInstantMessage(token, toUserId, message);
      return Right(result);
    } on SocketException {
      return const Left(ConnectionFailure("Tidak ada koneksi internet"));
    } on ServerException {
      return const Left(ServerFailure("Terjadi kesalahan pada server"));
    }
  }

  @override
  Future<Either<Failure, int>> getUnreadMessageCount() async {
    try {
      final token = await storage.read('token');
      final userId = await storage.read('userId');
      final result = await chatApiImpl.getUnreadConversationCount(
          token, int.parse(userId));
      return Right(result);
    } on SocketException {
      return const Left(ConnectionFailure("Tidak ada koneksi internet"));
    } on ServerException {
      return const Left(ServerFailure("Terjadi kesalahan pada server"));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteConversations(int conversationIds)async {
    try {
      final token = await storage.read('token');
      final userId = await storage.read('userId');
      final result = await chatApiImpl.deleteConversation(token, int.parse(userId), conversationIds);
      return const Right(true);
    } on SocketException {
      return const Left(ConnectionFailure("Tidak ada koneksi internet"));
    } on ServerException {
      return const Left(ServerFailure("Terjadi kesalahan pada server"));
    }
  }

  @override
  Future<Either<Failure, bool>> setFavoriteConversations(int conversations)async {
    try {
      final token = await storage.read('token');
      final userId = await storage.read('userId');
      final result = await chatApiImpl.setConversationFavorite(token, int.parse(userId), conversations);
      return const Right(true);
    } on SocketException {
      return const Left(ConnectionFailure("Tidak ada koneksi internet"));
    } on ServerException {
      return const Left(ServerFailure("Terjadi kesalahan pada server"));
    }
  }

  @override
  Future<Either<Failure, bool>> unsetFavoriteConversations(int conversations)async {
    try {
      final token = await storage.read('token');
      final userId = await storage.read('userId');
      final result = await chatApiImpl.unsetConversationFavorite(token, int.parse(userId), conversations);
      return Right(result);
    } on SocketException {
      return const Left(ConnectionFailure("Tidak ada koneksi internet"));
    } on ServerException {
      return const Left(ServerFailure("Terjadi kesalahan pada server"));
    }
  }

  @override
  Future<Either<Failure, ConversationModel>> getConversationsBetweenUser(int otheruserid)async {
    try {
      final token = await storage.read('token');
      final userId = await storage.read('userId');
      final result = await chatApiImpl.getConversationsBetweenUser(token, int.parse(userId), otheruserid);
      return Right(result);
    } on SocketException {
      return const Left(ConnectionFailure("Tidak ada koneksi internet"));
    } on ServerException {
      return const Left(ServerFailure("Terjadi kesalahan pada server"));
    }
  }

  @override
  Future<Either<Failure, bool>> blockUser(int blockedUserId)async {
    try {
      final token = await storage.read('token');
      final userId = await storage.read('userId');
      final result = await chatApiImpl.blockUser(token, int.parse(userId), blockedUserId);
      return Right(result);
    } on SocketException {
      return const Left(ConnectionFailure("Tidak ada koneksi internet"));
    } on ServerException {
      return const Left(ServerFailure("Terjadi kesalahan pada server"));
    }
  }

  @override
  Future<Either<Failure, bool>> unblockUser(int unblockUserId)async {
    try {
      final token = await storage.read('token');
      final userId = await storage.read('userId');
      final result = await chatApiImpl.unblockUser(token, int.parse(userId), unblockUserId);
      return Right(result);
    } on SocketException {
      return const Left(ConnectionFailure("Tidak ada koneksi internet"));
    } on ServerException {
      return const Left(ServerFailure("Terjadi kesalahan pada server"));
    }
  }





}
