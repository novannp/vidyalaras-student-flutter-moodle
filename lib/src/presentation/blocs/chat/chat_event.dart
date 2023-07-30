part of 'chat_bloc.dart';

@freezed
class ChatEvent with _$ChatEvent {
  const factory ChatEvent.getConversations() = _GetConversations;
  const factory ChatEvent.getConversationMessage(int conversationId) =
      _GetConversationMessage;
  const factory ChatEvent.getMemberInfo(int memberId) = _GetMemberInfo;
  const factory ChatEvent.sendInstantMessage(int toUserId, String message) =
      _SendInstantMessage;
  const factory ChatEvent.resetMessage() = _ResetMessage;
  const factory ChatEvent.getUnreadMessageCount() = _GetUnreadMessageCount;
  const factory ChatEvent.setConversationFavorite(int conversations) =
      _SetFavoriteConversations;
  const factory ChatEvent.unsetConversationFavorite(int conversations) =
      _UnsetFavoriteConversations;
  const factory ChatEvent.deleteConversation(int conversationIds) =
      _DeleteConversation;
  const factory ChatEvent.getConversationBetweenUser(int otherUserId) =
      _GetConversationBetweenUser;
}
