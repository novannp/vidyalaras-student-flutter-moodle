part of 'notification.dart';

class MarkAllNotificationsAsRead {
  final NotificationRepositoryImpl _notificationRepositoryImpl;

  MarkAllNotificationsAsRead(this._notificationRepositoryImpl);

  Future<Either<Failure, bool>> execute() async {
    return await _notificationRepositoryImpl.markAllNotificationAsRead();
  }
}
