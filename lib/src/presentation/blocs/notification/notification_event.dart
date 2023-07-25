part of 'notification_bloc.dart';

@freezed
class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.getNotifications() = _GetNotifications;
  const factory NotificationEvent.getNotificationCount() =
      _GetNotificationCount;
}
