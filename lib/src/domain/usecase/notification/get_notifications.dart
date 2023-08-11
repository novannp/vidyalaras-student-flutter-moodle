part of 'notification.dart';

class GetNotifications {
  final NotificationRepository _notificationRepositoryImpl;

  GetNotifications(this._notificationRepositoryImpl);

  Future<Either<Failure, List<NotificationModel>>> execute() async {
    return await _notificationRepositoryImpl.getNotifications();
  }
}
