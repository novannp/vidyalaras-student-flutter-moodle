import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:lms_pptik/src/utils/exceptions.dart';
import 'package:lms_pptik/src/utils/helper/secure_storage/secure_storage.dart';

import '../../data/data_sources/notification_api.dart';
import '../../data/models/notification_model.dart';
import '../../utils/failures.dart';

abstract class NotificationRepository {
  Future<Either<Failure, List<NotificationModel>>> getNotifications();

  Future<Either<Failure, int>> getNotificationCount();
}
