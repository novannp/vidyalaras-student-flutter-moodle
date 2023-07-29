part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.getCurrenctUser() = _GetCurrentUser;
  const factory UserEvent.updatePicture(int itemId) = _UpdatePicture;
}
