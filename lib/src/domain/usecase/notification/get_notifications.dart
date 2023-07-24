part of 'notification.dart';

class GetNotifications {
  final NotificationRepositoryImpl _notificationRepositoryImpl;

  GetNotifications(this._notificationRepositoryImpl);

  Future<Either<Failure, List<NotificationModel>>> execute() async {
    return await _notificationRepositoryImpl.getNotifications();
  }
}
