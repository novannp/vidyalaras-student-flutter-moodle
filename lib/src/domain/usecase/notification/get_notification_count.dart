part of 'notification.dart';

class GetNotificationCount {
  final NotificationRepositoryImpl _notificationRepository;

  GetNotificationCount(this._notificationRepository);

  Future<Either<Failure, int>> execute() async {
    return await _notificationRepository.getNotificationCount();
  }
}
