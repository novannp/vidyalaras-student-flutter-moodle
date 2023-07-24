import 'package:dartz/dartz.dart';

import '../../../data/models/notification_model.dart';
import '../../../utils/failures.dart';
import '../../repositories/notification_repository.dart';

class GetNotifications {
  final NotificationRepositoryImpl _notificationRepositoryImpl;

  GetNotifications(this._notificationRepositoryImpl);

  Future<Either<Failure, List<NotificationModel>>> execute() async {
    return await _notificationRepositoryImpl.getNotifications();
  }
}
