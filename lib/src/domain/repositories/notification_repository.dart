import 'package:dartz/dartz.dart';

import '../../data/models/notification_model.dart';
import '../../utils/failures.dart';

abstract class NotificationRepository {
  Future<Either<Failure, List<NotificationModel>>> getNotifications();

  Future<Either<Failure, int>> getNotificationCount();
}
