part of 'notification.dart';

class GetNotificationCount {
  final NotificationRepository _notificationRepository;

  GetNotificationCount(this._notificationRepository);

  Future<Either<Failure, int>> execute() async {
    return await _notificationRepository.getNotificationCount();
  }
}
