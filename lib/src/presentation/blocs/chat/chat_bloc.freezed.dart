// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChatEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getConversations,
    required TResult Function(int conversationId) getConversationMessage,
    required TResult Function(int memberId) getMemberInfo,
    required TResult Function(int toUserId, String message) sendInstantMessage,
    required TResult Function() resetMessage,
    required TResult Function() getUnreadMessageCount,
    required TResult Function(int conversations) setConversationFavorite,
    required TResult Function(int conversations) unsetConversationFavorite,
    required TResult Function(int conversationIds) deleteConversation,
    required TResult Function(int otherUserId) getConversationBetweenUser,
    required TResult Function(int blockedUserId) blockUser,
    required TResult Function(int unblockUserId) unblockUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getConversations,
    TResult? Function(int conversationId)? getConversationMessage,
    TResult? Function(int memberId)? getMemberInfo,
    TResult? Function(int toUserId, String message)? sendInstantMessage,
    TResult? Function()? resetMessage,
    TResult? Function()? getUnreadMessageCount,
    TResult? Function(int conversations)? setConversationFavorite,
    TResult? Function(int conversations)? unsetConversationFavorite,
    TResult? Function(int conversationIds)? deleteConversation,
    TResult? Function(int otherUserId)? getConversationBetweenUser,
    TResult? Function(int blockedUserId)? blockUser,
    TResult? Function(int unblockUserId)? unblockUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getConversations,
    TResult Function(int conversationId)? getConversationMessage,
    TResult Function(int memberId)? getMemberInfo,
    TResult Function(int toUserId, String message)? sendInstantMessage,
    TResult Function()? resetMessage,
    TResult Function()? getUnreadMessageCount,
    TResult Function(int conversations)? setConversationFavorite,
    TResult Function(int conversations)? unsetConversationFavorite,
    TResult Function(int conversationIds)? deleteConversation,
    TResult Function(int otherUserId)? getConversationBetweenUser,
    TResult Function(int blockedUserId)? blockUser,
    TResult Function(int unblockUserId)? unblockUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetConversations value) getConversations,
    required TResult Function(_GetConversationMessage value)
        getConversationMessage,
    required TResult Function(_GetMemberInfo value) getMemberInfo,
    required TResult Function(_SendInstantMessage value) sendInstantMessage,
    required TResult Function(_ResetMessage value) resetMessage,
    required TResult Function(_GetUnreadMessageCount value)
        getUnreadMessageCount,
    required TResult Function(_SetFavoriteConversations value)
        setConversationFavorite,
    required TResult Function(_UnsetFavoriteConversations value)
        unsetConversationFavorite,
    required TResult Function(_DeleteConversation value) deleteConversation,
    required TResult Function(_GetConversationBetweenUser value)
        getConversationBetweenUser,
    required TResult Function(_BlockUser value) blockUser,
    required TResult Function(_UnblockUser value) unblockUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetConversations value)? getConversations,
    TResult? Function(_GetConversationMessage value)? getConversationMessage,
    TResult? Function(_GetMemberInfo value)? getMemberInfo,
    TResult? Function(_SendInstantMessage value)? sendInstantMessage,
    TResult? Function(_ResetMessage value)? resetMessage,
    TResult? Function(_GetUnreadMessageCount value)? getUnreadMessageCount,
    TResult? Function(_SetFavoriteConversations value)? setConversationFavorite,
    TResult? Function(_UnsetFavoriteConversations value)?
        unsetConversationFavorite,
    TResult? Function(_DeleteConversation value)? deleteConversation,
    TResult? Function(_GetConversationBetweenUser value)?
        getConversationBetweenUser,
    TResult? Function(_BlockUser value)? blockUser,
    TResult? Function(_UnblockUser value)? unblockUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetConversations value)? getConversations,
    TResult Function(_GetConversationMessage value)? getConversationMessage,
    TResult Function(_GetMemberInfo value)? getMemberInfo,
    TResult Function(_SendInstantMessage value)? sendInstantMessage,
    TResult Function(_ResetMessage value)? resetMessage,
    TResult Function(_GetUnreadMessageCount value)? getUnreadMessageCount,
    TResult Function(_SetFavoriteConversations value)? setConversationFavorite,
    TResult Function(_UnsetFavoriteConversations value)?
        unsetConversationFavorite,
    TResult Function(_DeleteConversation value)? deleteConversation,
    TResult Function(_GetConversationBetweenUser value)?
        getConversationBetweenUser,
    TResult Function(_BlockUser value)? blockUser,
    TResult Function(_UnblockUser value)? unblockUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatEventCopyWith<$Res> {
  factory $ChatEventCopyWith(ChatEvent value, $Res Function(ChatEvent) then) =
      _$ChatEventCopyWithImpl<$Res, ChatEvent>;
}

/// @nodoc
class _$ChatEventCopyWithImpl<$Res, $Val extends ChatEvent>
    implements $ChatEventCopyWith<$Res> {
  _$ChatEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetConversationsCopyWith<$Res> {
  factory _$$_GetConversationsCopyWith(
          _$_GetConversations value, $Res Function(_$_GetConversations) then) =
      __$$_GetConversationsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetConversationsCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$_GetConversations>
    implements _$$_GetConversationsCopyWith<$Res> {
  __$$_GetConversationsCopyWithImpl(
      _$_GetConversations _value, $Res Function(_$_GetConversations) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetConversations implements _GetConversations {
  const _$_GetConversations();

  @override
  String toString() {
    return 'ChatEvent.getConversations()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetConversations);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getConversations,
    required TResult Function(int conversationId) getConversationMessage,
    required TResult Function(int memberId) getMemberInfo,
    required TResult Function(int toUserId, String message) sendInstantMessage,
    required TResult Function() resetMessage,
    required TResult Function() getUnreadMessageCount,
    required TResult Function(int conversations) setConversationFavorite,
    required TResult Function(int conversations) unsetConversationFavorite,
    required TResult Function(int conversationIds) deleteConversation,
    required TResult Function(int otherUserId) getConversationBetweenUser,
    required TResult Function(int blockedUserId) blockUser,
    required TResult Function(int unblockUserId) unblockUser,
  }) {
    return getConversations();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getConversations,
    TResult? Function(int conversationId)? getConversationMessage,
    TResult? Function(int memberId)? getMemberInfo,
    TResult? Function(int toUserId, String message)? sendInstantMessage,
    TResult? Function()? resetMessage,
    TResult? Function()? getUnreadMessageCount,
    TResult? Function(int conversations)? setConversationFavorite,
    TResult? Function(int conversations)? unsetConversationFavorite,
    TResult? Function(int conversationIds)? deleteConversation,
    TResult? Function(int otherUserId)? getConversationBetweenUser,
    TResult? Function(int blockedUserId)? blockUser,
    TResult? Function(int unblockUserId)? unblockUser,
  }) {
    return getConversations?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getConversations,
    TResult Function(int conversationId)? getConversationMessage,
    TResult Function(int memberId)? getMemberInfo,
    TResult Function(int toUserId, String message)? sendInstantMessage,
    TResult Function()? resetMessage,
    TResult Function()? getUnreadMessageCount,
    TResult Function(int conversations)? setConversationFavorite,
    TResult Function(int conversations)? unsetConversationFavorite,
    TResult Function(int conversationIds)? deleteConversation,
    TResult Function(int otherUserId)? getConversationBetweenUser,
    TResult Function(int blockedUserId)? blockUser,
    TResult Function(int unblockUserId)? unblockUser,
    required TResult orElse(),
  }) {
    if (getConversations != null) {
      return getConversations();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetConversations value) getConversations,
    required TResult Function(_GetConversationMessage value)
        getConversationMessage,
    required TResult Function(_GetMemberInfo value) getMemberInfo,
    required TResult Function(_SendInstantMessage value) sendInstantMessage,
    required TResult Function(_ResetMessage value) resetMessage,
    required TResult Function(_GetUnreadMessageCount value)
        getUnreadMessageCount,
    required TResult Function(_SetFavoriteConversations value)
        setConversationFavorite,
    required TResult Function(_UnsetFavoriteConversations value)
        unsetConversationFavorite,
    required TResult Function(_DeleteConversation value) deleteConversation,
    required TResult Function(_GetConversationBetweenUser value)
        getConversationBetweenUser,
    required TResult Function(_BlockUser value) blockUser,
    required TResult Function(_UnblockUser value) unblockUser,
  }) {
    return getConversations(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetConversations value)? getConversations,
    TResult? Function(_GetConversationMessage value)? getConversationMessage,
    TResult? Function(_GetMemberInfo value)? getMemberInfo,
    TResult? Function(_SendInstantMessage value)? sendInstantMessage,
    TResult? Function(_ResetMessage value)? resetMessage,
    TResult? Function(_GetUnreadMessageCount value)? getUnreadMessageCount,
    TResult? Function(_SetFavoriteConversations value)? setConversationFavorite,
    TResult? Function(_UnsetFavoriteConversations value)?
        unsetConversationFavorite,
    TResult? Function(_DeleteConversation value)? deleteConversation,
    TResult? Function(_GetConversationBetweenUser value)?
        getConversationBetweenUser,
    TResult? Function(_BlockUser value)? blockUser,
    TResult? Function(_UnblockUser value)? unblockUser,
  }) {
    return getConversations?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetConversations value)? getConversations,
    TResult Function(_GetConversationMessage value)? getConversationMessage,
    TResult Function(_GetMemberInfo value)? getMemberInfo,
    TResult Function(_SendInstantMessage value)? sendInstantMessage,
    TResult Function(_ResetMessage value)? resetMessage,
    TResult Function(_GetUnreadMessageCount value)? getUnreadMessageCount,
    TResult Function(_SetFavoriteConversations value)? setConversationFavorite,
    TResult Function(_UnsetFavoriteConversations value)?
        unsetConversationFavorite,
    TResult Function(_DeleteConversation value)? deleteConversation,
    TResult Function(_GetConversationBetweenUser value)?
        getConversationBetweenUser,
    TResult Function(_BlockUser value)? blockUser,
    TResult Function(_UnblockUser value)? unblockUser,
    required TResult orElse(),
  }) {
    if (getConversations != null) {
      return getConversations(this);
    }
    return orElse();
  }
}

abstract class _GetConversations implements ChatEvent {
  const factory _GetConversations() = _$_GetConversations;
}

/// @nodoc
abstract class _$$_GetConversationMessageCopyWith<$Res> {
  factory _$$_GetConversationMessageCopyWith(_$_GetConversationMessage value,
          $Res Function(_$_GetConversationMessage) then) =
      __$$_GetConversationMessageCopyWithImpl<$Res>;
  @useResult
  $Res call({int conversationId});
}

/// @nodoc
class __$$_GetConversationMessageCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$_GetConversationMessage>
    implements _$$_GetConversationMessageCopyWith<$Res> {
  __$$_GetConversationMessageCopyWithImpl(_$_GetConversationMessage _value,
      $Res Function(_$_GetConversationMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversationId = null,
  }) {
    return _then(_$_GetConversationMessage(
      null == conversationId
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GetConversationMessage implements _GetConversationMessage {
  const _$_GetConversationMessage(this.conversationId);

  @override
  final int conversationId;

  @override
  String toString() {
    return 'ChatEvent.getConversationMessage(conversationId: $conversationId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetConversationMessage &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, conversationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetConversationMessageCopyWith<_$_GetConversationMessage> get copyWith =>
      __$$_GetConversationMessageCopyWithImpl<_$_GetConversationMessage>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getConversations,
    required TResult Function(int conversationId) getConversationMessage,
    required TResult Function(int memberId) getMemberInfo,
    required TResult Function(int toUserId, String message) sendInstantMessage,
    required TResult Function() resetMessage,
    required TResult Function() getUnreadMessageCount,
    required TResult Function(int conversations) setConversationFavorite,
    required TResult Function(int conversations) unsetConversationFavorite,
    required TResult Function(int conversationIds) deleteConversation,
    required TResult Function(int otherUserId) getConversationBetweenUser,
    required TResult Function(int blockedUserId) blockUser,
    required TResult Function(int unblockUserId) unblockUser,
  }) {
    return getConversationMessage(conversationId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getConversations,
    TResult? Function(int conversationId)? getConversationMessage,
    TResult? Function(int memberId)? getMemberInfo,
    TResult? Function(int toUserId, String message)? sendInstantMessage,
    TResult? Function()? resetMessage,
    TResult? Function()? getUnreadMessageCount,
    TResult? Function(int conversations)? setConversationFavorite,
    TResult? Function(int conversations)? unsetConversationFavorite,
    TResult? Function(int conversationIds)? deleteConversation,
    TResult? Function(int otherUserId)? getConversationBetweenUser,
    TResult? Function(int blockedUserId)? blockUser,
    TResult? Function(int unblockUserId)? unblockUser,
  }) {
    return getConversationMessage?.call(conversationId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getConversations,
    TResult Function(int conversationId)? getConversationMessage,
    TResult Function(int memberId)? getMemberInfo,
    TResult Function(int toUserId, String message)? sendInstantMessage,
    TResult Function()? resetMessage,
    TResult Function()? getUnreadMessageCount,
    TResult Function(int conversations)? setConversationFavorite,
    TResult Function(int conversations)? unsetConversationFavorite,
    TResult Function(int conversationIds)? deleteConversation,
    TResult Function(int otherUserId)? getConversationBetweenUser,
    TResult Function(int blockedUserId)? blockUser,
    TResult Function(int unblockUserId)? unblockUser,
    required TResult orElse(),
  }) {
    if (getConversationMessage != null) {
      return getConversationMessage(conversationId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetConversations value) getConversations,
    required TResult Function(_GetConversationMessage value)
        getConversationMessage,
    required TResult Function(_GetMemberInfo value) getMemberInfo,
    required TResult Function(_SendInstantMessage value) sendInstantMessage,
    required TResult Function(_ResetMessage value) resetMessage,
    required TResult Function(_GetUnreadMessageCount value)
        getUnreadMessageCount,
    required TResult Function(_SetFavoriteConversations value)
        setConversationFavorite,
    required TResult Function(_UnsetFavoriteConversations value)
        unsetConversationFavorite,
    required TResult Function(_DeleteConversation value) deleteConversation,
    required TResult Function(_GetConversationBetweenUser value)
        getConversationBetweenUser,
    required TResult Function(_BlockUser value) blockUser,
    required TResult Function(_UnblockUser value) unblockUser,
  }) {
    return getConversationMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetConversations value)? getConversations,
    TResult? Function(_GetConversationMessage value)? getConversationMessage,
    TResult? Function(_GetMemberInfo value)? getMemberInfo,
    TResult? Function(_SendInstantMessage value)? sendInstantMessage,
    TResult? Function(_ResetMessage value)? resetMessage,
    TResult? Function(_GetUnreadMessageCount value)? getUnreadMessageCount,
    TResult? Function(_SetFavoriteConversations value)? setConversationFavorite,
    TResult? Function(_UnsetFavoriteConversations value)?
        unsetConversationFavorite,
    TResult? Function(_DeleteConversation value)? deleteConversation,
    TResult? Function(_GetConversationBetweenUser value)?
        getConversationBetweenUser,
    TResult? Function(_BlockUser value)? blockUser,
    TResult? Function(_UnblockUser value)? unblockUser,
  }) {
    return getConversationMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetConversations value)? getConversations,
    TResult Function(_GetConversationMessage value)? getConversationMessage,
    TResult Function(_GetMemberInfo value)? getMemberInfo,
    TResult Function(_SendInstantMessage value)? sendInstantMessage,
    TResult Function(_ResetMessage value)? resetMessage,
    TResult Function(_GetUnreadMessageCount value)? getUnreadMessageCount,
    TResult Function(_SetFavoriteConversations value)? setConversationFavorite,
    TResult Function(_UnsetFavoriteConversations value)?
        unsetConversationFavorite,
    TResult Function(_DeleteConversation value)? deleteConversation,
    TResult Function(_GetConversationBetweenUser value)?
        getConversationBetweenUser,
    TResult Function(_BlockUser value)? blockUser,
    TResult Function(_UnblockUser value)? unblockUser,
    required TResult orElse(),
  }) {
    if (getConversationMessage != null) {
      return getConversationMessage(this);
    }
    return orElse();
  }
}

abstract class _GetConversationMessage implements ChatEvent {
  const factory _GetConversationMessage(final int conversationId) =
      _$_GetConversationMessage;

  int get conversationId;
  @JsonKey(ignore: true)
  _$$_GetConversationMessageCopyWith<_$_GetConversationMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetMemberInfoCopyWith<$Res> {
  factory _$$_GetMemberInfoCopyWith(
          _$_GetMemberInfo value, $Res Function(_$_GetMemberInfo) then) =
      __$$_GetMemberInfoCopyWithImpl<$Res>;
  @useResult
  $Res call({int memberId});
}

/// @nodoc
class __$$_GetMemberInfoCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$_GetMemberInfo>
    implements _$$_GetMemberInfoCopyWith<$Res> {
  __$$_GetMemberInfoCopyWithImpl(
      _$_GetMemberInfo _value, $Res Function(_$_GetMemberInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memberId = null,
  }) {
    return _then(_$_GetMemberInfo(
      null == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GetMemberInfo implements _GetMemberInfo {
  const _$_GetMemberInfo(this.memberId);

  @override
  final int memberId;

  @override
  String toString() {
    return 'ChatEvent.getMemberInfo(memberId: $memberId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetMemberInfo &&
            (identical(other.memberId, memberId) ||
                other.memberId == memberId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, memberId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetMemberInfoCopyWith<_$_GetMemberInfo> get copyWith =>
      __$$_GetMemberInfoCopyWithImpl<_$_GetMemberInfo>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getConversations,
    required TResult Function(int conversationId) getConversationMessage,
    required TResult Function(int memberId) getMemberInfo,
    required TResult Function(int toUserId, String message) sendInstantMessage,
    required TResult Function() resetMessage,
    required TResult Function() getUnreadMessageCount,
    required TResult Function(int conversations) setConversationFavorite,
    required TResult Function(int conversations) unsetConversationFavorite,
    required TResult Function(int conversationIds) deleteConversation,
    required TResult Function(int otherUserId) getConversationBetweenUser,
    required TResult Function(int blockedUserId) blockUser,
    required TResult Function(int unblockUserId) unblockUser,
  }) {
    return getMemberInfo(memberId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getConversations,
    TResult? Function(int conversationId)? getConversationMessage,
    TResult? Function(int memberId)? getMemberInfo,
    TResult? Function(int toUserId, String message)? sendInstantMessage,
    TResult? Function()? resetMessage,
    TResult? Function()? getUnreadMessageCount,
    TResult? Function(int conversations)? setConversationFavorite,
    TResult? Function(int conversations)? unsetConversationFavorite,
    TResult? Function(int conversationIds)? deleteConversation,
    TResult? Function(int otherUserId)? getConversationBetweenUser,
    TResult? Function(int blockedUserId)? blockUser,
    TResult? Function(int unblockUserId)? unblockUser,
  }) {
    return getMemberInfo?.call(memberId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getConversations,
    TResult Function(int conversationId)? getConversationMessage,
    TResult Function(int memberId)? getMemberInfo,
    TResult Function(int toUserId, String message)? sendInstantMessage,
    TResult Function()? resetMessage,
    TResult Function()? getUnreadMessageCount,
    TResult Function(int conversations)? setConversationFavorite,
    TResult Function(int conversations)? unsetConversationFavorite,
    TResult Function(int conversationIds)? deleteConversation,
    TResult Function(int otherUserId)? getConversationBetweenUser,
    TResult Function(int blockedUserId)? blockUser,
    TResult Function(int unblockUserId)? unblockUser,
    required TResult orElse(),
  }) {
    if (getMemberInfo != null) {
      return getMemberInfo(memberId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetConversations value) getConversations,
    required TResult Function(_GetConversationMessage value)
        getConversationMessage,
    required TResult Function(_GetMemberInfo value) getMemberInfo,
    required TResult Function(_SendInstantMessage value) sendInstantMessage,
    required TResult Function(_ResetMessage value) resetMessage,
    required TResult Function(_GetUnreadMessageCount value)
        getUnreadMessageCount,
    required TResult Function(_SetFavoriteConversations value)
        setConversationFavorite,
    required TResult Function(_UnsetFavoriteConversations value)
        unsetConversationFavorite,
    required TResult Function(_DeleteConversation value) deleteConversation,
    required TResult Function(_GetConversationBetweenUser value)
        getConversationBetweenUser,
    required TResult Function(_BlockUser value) blockUser,
    required TResult Function(_UnblockUser value) unblockUser,
  }) {
    return getMemberInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetConversations value)? getConversations,
    TResult? Function(_GetConversationMessage value)? getConversationMessage,
    TResult? Function(_GetMemberInfo value)? getMemberInfo,
    TResult? Function(_SendInstantMessage value)? sendInstantMessage,
    TResult? Function(_ResetMessage value)? resetMessage,
    TResult? Function(_GetUnreadMessageCount value)? getUnreadMessageCount,
    TResult? Function(_SetFavoriteConversations value)? setConversationFavorite,
    TResult? Function(_UnsetFavoriteConversations value)?
        unsetConversationFavorite,
    TResult? Function(_DeleteConversation value)? deleteConversation,
    TResult? Function(_GetConversationBetweenUser value)?
        getConversationBetweenUser,
    TResult? Function(_BlockUser value)? blockUser,
    TResult? Function(_UnblockUser value)? unblockUser,
  }) {
    return getMemberInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetConversations value)? getConversations,
    TResult Function(_GetConversationMessage value)? getConversationMessage,
    TResult Function(_GetMemberInfo value)? getMemberInfo,
    TResult Function(_SendInstantMessage value)? sendInstantMessage,
    TResult Function(_ResetMessage value)? resetMessage,
    TResult Function(_GetUnreadMessageCount value)? getUnreadMessageCount,
    TResult Function(_SetFavoriteConversations value)? setConversationFavorite,
    TResult Function(_UnsetFavoriteConversations value)?
        unsetConversationFavorite,
    TResult Function(_DeleteConversation value)? deleteConversation,
    TResult Function(_GetConversationBetweenUser value)?
        getConversationBetweenUser,
    TResult Function(_BlockUser value)? blockUser,
    TResult Function(_UnblockUser value)? unblockUser,
    required TResult orElse(),
  }) {
    if (getMemberInfo != null) {
      return getMemberInfo(this);
    }
    return orElse();
  }
}

abstract class _GetMemberInfo implements ChatEvent {
  const factory _GetMemberInfo(final int memberId) = _$_GetMemberInfo;

  int get memberId;
  @JsonKey(ignore: true)
  _$$_GetMemberInfoCopyWith<_$_GetMemberInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SendInstantMessageCopyWith<$Res> {
  factory _$$_SendInstantMessageCopyWith(_$_SendInstantMessage value,
          $Res Function(_$_SendInstantMessage) then) =
      __$$_SendInstantMessageCopyWithImpl<$Res>;
  @useResult
  $Res call({int toUserId, String message});
}

/// @nodoc
class __$$_SendInstantMessageCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$_SendInstantMessage>
    implements _$$_SendInstantMessageCopyWith<$Res> {
  __$$_SendInstantMessageCopyWithImpl(
      _$_SendInstantMessage _value, $Res Function(_$_SendInstantMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toUserId = null,
    Object? message = null,
  }) {
    return _then(_$_SendInstantMessage(
      null == toUserId
          ? _value.toUserId
          : toUserId // ignore: cast_nullable_to_non_nullable
              as int,
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SendInstantMessage implements _SendInstantMessage {
  const _$_SendInstantMessage(this.toUserId, this.message);

  @override
  final int toUserId;
  @override
  final String message;

  @override
  String toString() {
    return 'ChatEvent.sendInstantMessage(toUserId: $toUserId, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SendInstantMessage &&
            (identical(other.toUserId, toUserId) ||
                other.toUserId == toUserId) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, toUserId, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SendInstantMessageCopyWith<_$_SendInstantMessage> get copyWith =>
      __$$_SendInstantMessageCopyWithImpl<_$_SendInstantMessage>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getConversations,
    required TResult Function(int conversationId) getConversationMessage,
    required TResult Function(int memberId) getMemberInfo,
    required TResult Function(int toUserId, String message) sendInstantMessage,
    required TResult Function() resetMessage,
    required TResult Function() getUnreadMessageCount,
    required TResult Function(int conversations) setConversationFavorite,
    required TResult Function(int conversations) unsetConversationFavorite,
    required TResult Function(int conversationIds) deleteConversation,
    required TResult Function(int otherUserId) getConversationBetweenUser,
    required TResult Function(int blockedUserId) blockUser,
    required TResult Function(int unblockUserId) unblockUser,
  }) {
    return sendInstantMessage(toUserId, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getConversations,
    TResult? Function(int conversationId)? getConversationMessage,
    TResult? Function(int memberId)? getMemberInfo,
    TResult? Function(int toUserId, String message)? sendInstantMessage,
    TResult? Function()? resetMessage,
    TResult? Function()? getUnreadMessageCount,
    TResult? Function(int conversations)? setConversationFavorite,
    TResult? Function(int conversations)? unsetConversationFavorite,
    TResult? Function(int conversationIds)? deleteConversation,
    TResult? Function(int otherUserId)? getConversationBetweenUser,
    TResult? Function(int blockedUserId)? blockUser,
    TResult? Function(int unblockUserId)? unblockUser,
  }) {
    return sendInstantMessage?.call(toUserId, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getConversations,
    TResult Function(int conversationId)? getConversationMessage,
    TResult Function(int memberId)? getMemberInfo,
    TResult Function(int toUserId, String message)? sendInstantMessage,
    TResult Function()? resetMessage,
    TResult Function()? getUnreadMessageCount,
    TResult Function(int conversations)? setConversationFavorite,
    TResult Function(int conversations)? unsetConversationFavorite,
    TResult Function(int conversationIds)? deleteConversation,
    TResult Function(int otherUserId)? getConversationBetweenUser,
    TResult Function(int blockedUserId)? blockUser,
    TResult Function(int unblockUserId)? unblockUser,
    required TResult orElse(),
  }) {
    if (sendInstantMessage != null) {
      return sendInstantMessage(toUserId, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetConversations value) getConversations,
    required TResult Function(_GetConversationMessage value)
        getConversationMessage,
    required TResult Function(_GetMemberInfo value) getMemberInfo,
    required TResult Function(_SendInstantMessage value) sendInstantMessage,
    required TResult Function(_ResetMessage value) resetMessage,
    required TResult Function(_GetUnreadMessageCount value)
        getUnreadMessageCount,
    required TResult Function(_SetFavoriteConversations value)
        setConversationFavorite,
    required TResult Function(_UnsetFavoriteConversations value)
        unsetConversationFavorite,
    required TResult Function(_DeleteConversation value) deleteConversation,
    required TResult Function(_GetConversationBetweenUser value)
        getConversationBetweenUser,
    required TResult Function(_BlockUser value) blockUser,
    required TResult Function(_UnblockUser value) unblockUser,
  }) {
    return sendInstantMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetConversations value)? getConversations,
    TResult? Function(_GetConversationMessage value)? getConversationMessage,
    TResult? Function(_GetMemberInfo value)? getMemberInfo,
    TResult? Function(_SendInstantMessage value)? sendInstantMessage,
    TResult? Function(_ResetMessage value)? resetMessage,
    TResult? Function(_GetUnreadMessageCount value)? getUnreadMessageCount,
    TResult? Function(_SetFavoriteConversations value)? setConversationFavorite,
    TResult? Function(_UnsetFavoriteConversations value)?
        unsetConversationFavorite,
    TResult? Function(_DeleteConversation value)? deleteConversation,
    TResult? Function(_GetConversationBetweenUser value)?
        getConversationBetweenUser,
    TResult? Function(_BlockUser value)? blockUser,
    TResult? Function(_UnblockUser value)? unblockUser,
  }) {
    return sendInstantMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetConversations value)? getConversations,
    TResult Function(_GetConversationMessage value)? getConversationMessage,
    TResult Function(_GetMemberInfo value)? getMemberInfo,
    TResult Function(_SendInstantMessage value)? sendInstantMessage,
    TResult Function(_ResetMessage value)? resetMessage,
    TResult Function(_GetUnreadMessageCount value)? getUnreadMessageCount,
    TResult Function(_SetFavoriteConversations value)? setConversationFavorite,
    TResult Function(_UnsetFavoriteConversations value)?
        unsetConversationFavorite,
    TResult Function(_DeleteConversation value)? deleteConversation,
    TResult Function(_GetConversationBetweenUser value)?
        getConversationBetweenUser,
    TResult Function(_BlockUser value)? blockUser,
    TResult Function(_UnblockUser value)? unblockUser,
    required TResult orElse(),
  }) {
    if (sendInstantMessage != null) {
      return sendInstantMessage(this);
    }
    return orElse();
  }
}

abstract class _SendInstantMessage implements ChatEvent {
  const factory _SendInstantMessage(final int toUserId, final String message) =
      _$_SendInstantMessage;

  int get toUserId;
  String get message;
  @JsonKey(ignore: true)
  _$$_SendInstantMessageCopyWith<_$_SendInstantMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ResetMessageCopyWith<$Res> {
  factory _$$_ResetMessageCopyWith(
          _$_ResetMessage value, $Res Function(_$_ResetMessage) then) =
      __$$_ResetMessageCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ResetMessageCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$_ResetMessage>
    implements _$$_ResetMessageCopyWith<$Res> {
  __$$_ResetMessageCopyWithImpl(
      _$_ResetMessage _value, $Res Function(_$_ResetMessage) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ResetMessage implements _ResetMessage {
  const _$_ResetMessage();

  @override
  String toString() {
    return 'ChatEvent.resetMessage()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ResetMessage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getConversations,
    required TResult Function(int conversationId) getConversationMessage,
    required TResult Function(int memberId) getMemberInfo,
    required TResult Function(int toUserId, String message) sendInstantMessage,
    required TResult Function() resetMessage,
    required TResult Function() getUnreadMessageCount,
    required TResult Function(int conversations) setConversationFavorite,
    required TResult Function(int conversations) unsetConversationFavorite,
    required TResult Function(int conversationIds) deleteConversation,
    required TResult Function(int otherUserId) getConversationBetweenUser,
    required TResult Function(int blockedUserId) blockUser,
    required TResult Function(int unblockUserId) unblockUser,
  }) {
    return resetMessage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getConversations,
    TResult? Function(int conversationId)? getConversationMessage,
    TResult? Function(int memberId)? getMemberInfo,
    TResult? Function(int toUserId, String message)? sendInstantMessage,
    TResult? Function()? resetMessage,
    TResult? Function()? getUnreadMessageCount,
    TResult? Function(int conversations)? setConversationFavorite,
    TResult? Function(int conversations)? unsetConversationFavorite,
    TResult? Function(int conversationIds)? deleteConversation,
    TResult? Function(int otherUserId)? getConversationBetweenUser,
    TResult? Function(int blockedUserId)? blockUser,
    TResult? Function(int unblockUserId)? unblockUser,
  }) {
    return resetMessage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getConversations,
    TResult Function(int conversationId)? getConversationMessage,
    TResult Function(int memberId)? getMemberInfo,
    TResult Function(int toUserId, String message)? sendInstantMessage,
    TResult Function()? resetMessage,
    TResult Function()? getUnreadMessageCount,
    TResult Function(int conversations)? setConversationFavorite,
    TResult Function(int conversations)? unsetConversationFavorite,
    TResult Function(int conversationIds)? deleteConversation,
    TResult Function(int otherUserId)? getConversationBetweenUser,
    TResult Function(int blockedUserId)? blockUser,
    TResult Function(int unblockUserId)? unblockUser,
    required TResult orElse(),
  }) {
    if (resetMessage != null) {
      return resetMessage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetConversations value) getConversations,
    required TResult Function(_GetConversationMessage value)
        getConversationMessage,
    required TResult Function(_GetMemberInfo value) getMemberInfo,
    required TResult Function(_SendInstantMessage value) sendInstantMessage,
    required TResult Function(_ResetMessage value) resetMessage,
    required TResult Function(_GetUnreadMessageCount value)
        getUnreadMessageCount,
    required TResult Function(_SetFavoriteConversations value)
        setConversationFavorite,
    required TResult Function(_UnsetFavoriteConversations value)
        unsetConversationFavorite,
    required TResult Function(_DeleteConversation value) deleteConversation,
    required TResult Function(_GetConversationBetweenUser value)
        getConversationBetweenUser,
    required TResult Function(_BlockUser value) blockUser,
    required TResult Function(_UnblockUser value) unblockUser,
  }) {
    return resetMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetConversations value)? getConversations,
    TResult? Function(_GetConversationMessage value)? getConversationMessage,
    TResult? Function(_GetMemberInfo value)? getMemberInfo,
    TResult? Function(_SendInstantMessage value)? sendInstantMessage,
    TResult? Function(_ResetMessage value)? resetMessage,
    TResult? Function(_GetUnreadMessageCount value)? getUnreadMessageCount,
    TResult? Function(_SetFavoriteConversations value)? setConversationFavorite,
    TResult? Function(_UnsetFavoriteConversations value)?
        unsetConversationFavorite,
    TResult? Function(_DeleteConversation value)? deleteConversation,
    TResult? Function(_GetConversationBetweenUser value)?
        getConversationBetweenUser,
    TResult? Function(_BlockUser value)? blockUser,
    TResult? Function(_UnblockUser value)? unblockUser,
  }) {
    return resetMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetConversations value)? getConversations,
    TResult Function(_GetConversationMessage value)? getConversationMessage,
    TResult Function(_GetMemberInfo value)? getMemberInfo,
    TResult Function(_SendInstantMessage value)? sendInstantMessage,
    TResult Function(_ResetMessage value)? resetMessage,
    TResult Function(_GetUnreadMessageCount value)? getUnreadMessageCount,
    TResult Function(_SetFavoriteConversations value)? setConversationFavorite,
    TResult Function(_UnsetFavoriteConversations value)?
        unsetConversationFavorite,
    TResult Function(_DeleteConversation value)? deleteConversation,
    TResult Function(_GetConversationBetweenUser value)?
        getConversationBetweenUser,
    TResult Function(_BlockUser value)? blockUser,
    TResult Function(_UnblockUser value)? unblockUser,
    required TResult orElse(),
  }) {
    if (resetMessage != null) {
      return resetMessage(this);
    }
    return orElse();
  }
}

abstract class _ResetMessage implements ChatEvent {
  const factory _ResetMessage() = _$_ResetMessage;
}

/// @nodoc
abstract class _$$_GetUnreadMessageCountCopyWith<$Res> {
  factory _$$_GetUnreadMessageCountCopyWith(_$_GetUnreadMessageCount value,
          $Res Function(_$_GetUnreadMessageCount) then) =
      __$$_GetUnreadMessageCountCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetUnreadMessageCountCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$_GetUnreadMessageCount>
    implements _$$_GetUnreadMessageCountCopyWith<$Res> {
  __$$_GetUnreadMessageCountCopyWithImpl(_$_GetUnreadMessageCount _value,
      $Res Function(_$_GetUnreadMessageCount) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetUnreadMessageCount implements _GetUnreadMessageCount {
  const _$_GetUnreadMessageCount();

  @override
  String toString() {
    return 'ChatEvent.getUnreadMessageCount()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetUnreadMessageCount);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getConversations,
    required TResult Function(int conversationId) getConversationMessage,
    required TResult Function(int memberId) getMemberInfo,
    required TResult Function(int toUserId, String message) sendInstantMessage,
    required TResult Function() resetMessage,
    required TResult Function() getUnreadMessageCount,
    required TResult Function(int conversations) setConversationFavorite,
    required TResult Function(int conversations) unsetConversationFavorite,
    required TResult Function(int conversationIds) deleteConversation,
    required TResult Function(int otherUserId) getConversationBetweenUser,
    required TResult Function(int blockedUserId) blockUser,
    required TResult Function(int unblockUserId) unblockUser,
  }) {
    return getUnreadMessageCount();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getConversations,
    TResult? Function(int conversationId)? getConversationMessage,
    TResult? Function(int memberId)? getMemberInfo,
    TResult? Function(int toUserId, String message)? sendInstantMessage,
    TResult? Function()? resetMessage,
    TResult? Function()? getUnreadMessageCount,
    TResult? Function(int conversations)? setConversationFavorite,
    TResult? Function(int conversations)? unsetConversationFavorite,
    TResult? Function(int conversationIds)? deleteConversation,
    TResult? Function(int otherUserId)? getConversationBetweenUser,
    TResult? Function(int blockedUserId)? blockUser,
    TResult? Function(int unblockUserId)? unblockUser,
  }) {
    return getUnreadMessageCount?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getConversations,
    TResult Function(int conversationId)? getConversationMessage,
    TResult Function(int memberId)? getMemberInfo,
    TResult Function(int toUserId, String message)? sendInstantMessage,
    TResult Function()? resetMessage,
    TResult Function()? getUnreadMessageCount,
    TResult Function(int conversations)? setConversationFavorite,
    TResult Function(int conversations)? unsetConversationFavorite,
    TResult Function(int conversationIds)? deleteConversation,
    TResult Function(int otherUserId)? getConversationBetweenUser,
    TResult Function(int blockedUserId)? blockUser,
    TResult Function(int unblockUserId)? unblockUser,
    required TResult orElse(),
  }) {
    if (getUnreadMessageCount != null) {
      return getUnreadMessageCount();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetConversations value) getConversations,
    required TResult Function(_GetConversationMessage value)
        getConversationMessage,
    required TResult Function(_GetMemberInfo value) getMemberInfo,
    required TResult Function(_SendInstantMessage value) sendInstantMessage,
    required TResult Function(_ResetMessage value) resetMessage,
    required TResult Function(_GetUnreadMessageCount value)
        getUnreadMessageCount,
    required TResult Function(_SetFavoriteConversations value)
        setConversationFavorite,
    required TResult Function(_UnsetFavoriteConversations value)
        unsetConversationFavorite,
    required TResult Function(_DeleteConversation value) deleteConversation,
    required TResult Function(_GetConversationBetweenUser value)
        getConversationBetweenUser,
    required TResult Function(_BlockUser value) blockUser,
    required TResult Function(_UnblockUser value) unblockUser,
  }) {
    return getUnreadMessageCount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetConversations value)? getConversations,
    TResult? Function(_GetConversationMessage value)? getConversationMessage,
    TResult? Function(_GetMemberInfo value)? getMemberInfo,
    TResult? Function(_SendInstantMessage value)? sendInstantMessage,
    TResult? Function(_ResetMessage value)? resetMessage,
    TResult? Function(_GetUnreadMessageCount value)? getUnreadMessageCount,
    TResult? Function(_SetFavoriteConversations value)? setConversationFavorite,
    TResult? Function(_UnsetFavoriteConversations value)?
        unsetConversationFavorite,
    TResult? Function(_DeleteConversation value)? deleteConversation,
    TResult? Function(_GetConversationBetweenUser value)?
        getConversationBetweenUser,
    TResult? Function(_BlockUser value)? blockUser,
    TResult? Function(_UnblockUser value)? unblockUser,
  }) {
    return getUnreadMessageCount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetConversations value)? getConversations,
    TResult Function(_GetConversationMessage value)? getConversationMessage,
    TResult Function(_GetMemberInfo value)? getMemberInfo,
    TResult Function(_SendInstantMessage value)? sendInstantMessage,
    TResult Function(_ResetMessage value)? resetMessage,
    TResult Function(_GetUnreadMessageCount value)? getUnreadMessageCount,
    TResult Function(_SetFavoriteConversations value)? setConversationFavorite,
    TResult Function(_UnsetFavoriteConversations value)?
        unsetConversationFavorite,
    TResult Function(_DeleteConversation value)? deleteConversation,
    TResult Function(_GetConversationBetweenUser value)?
        getConversationBetweenUser,
    TResult Function(_BlockUser value)? blockUser,
    TResult Function(_UnblockUser value)? unblockUser,
    required TResult orElse(),
  }) {
    if (getUnreadMessageCount != null) {
      return getUnreadMessageCount(this);
    }
    return orElse();
  }
}

abstract class _GetUnreadMessageCount implements ChatEvent {
  const factory _GetUnreadMessageCount() = _$_GetUnreadMessageCount;
}

/// @nodoc
abstract class _$$_SetFavoriteConversationsCopyWith<$Res> {
  factory _$$_SetFavoriteConversationsCopyWith(
          _$_SetFavoriteConversations value,
          $Res Function(_$_SetFavoriteConversations) then) =
      __$$_SetFavoriteConversationsCopyWithImpl<$Res>;
  @useResult
  $Res call({int conversations});
}

/// @nodoc
class __$$_SetFavoriteConversationsCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$_SetFavoriteConversations>
    implements _$$_SetFavoriteConversationsCopyWith<$Res> {
  __$$_SetFavoriteConversationsCopyWithImpl(_$_SetFavoriteConversations _value,
      $Res Function(_$_SetFavoriteConversations) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversations = null,
  }) {
    return _then(_$_SetFavoriteConversations(
      null == conversations
          ? _value.conversations
          : conversations // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SetFavoriteConversations implements _SetFavoriteConversations {
  const _$_SetFavoriteConversations(this.conversations);

  @override
  final int conversations;

  @override
  String toString() {
    return 'ChatEvent.setConversationFavorite(conversations: $conversations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetFavoriteConversations &&
            (identical(other.conversations, conversations) ||
                other.conversations == conversations));
  }

  @override
  int get hashCode => Object.hash(runtimeType, conversations);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetFavoriteConversationsCopyWith<_$_SetFavoriteConversations>
      get copyWith => __$$_SetFavoriteConversationsCopyWithImpl<
          _$_SetFavoriteConversations>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getConversations,
    required TResult Function(int conversationId) getConversationMessage,
    required TResult Function(int memberId) getMemberInfo,
    required TResult Function(int toUserId, String message) sendInstantMessage,
    required TResult Function() resetMessage,
    required TResult Function() getUnreadMessageCount,
    required TResult Function(int conversations) setConversationFavorite,
    required TResult Function(int conversations) unsetConversationFavorite,
    required TResult Function(int conversationIds) deleteConversation,
    required TResult Function(int otherUserId) getConversationBetweenUser,
    required TResult Function(int blockedUserId) blockUser,
    required TResult Function(int unblockUserId) unblockUser,
  }) {
    return setConversationFavorite(conversations);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getConversations,
    TResult? Function(int conversationId)? getConversationMessage,
    TResult? Function(int memberId)? getMemberInfo,
    TResult? Function(int toUserId, String message)? sendInstantMessage,
    TResult? Function()? resetMessage,
    TResult? Function()? getUnreadMessageCount,
    TResult? Function(int conversations)? setConversationFavorite,
    TResult? Function(int conversations)? unsetConversationFavorite,
    TResult? Function(int conversationIds)? deleteConversation,
    TResult? Function(int otherUserId)? getConversationBetweenUser,
    TResult? Function(int blockedUserId)? blockUser,
    TResult? Function(int unblockUserId)? unblockUser,
  }) {
    return setConversationFavorite?.call(conversations);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getConversations,
    TResult Function(int conversationId)? getConversationMessage,
    TResult Function(int memberId)? getMemberInfo,
    TResult Function(int toUserId, String message)? sendInstantMessage,
    TResult Function()? resetMessage,
    TResult Function()? getUnreadMessageCount,
    TResult Function(int conversations)? setConversationFavorite,
    TResult Function(int conversations)? unsetConversationFavorite,
    TResult Function(int conversationIds)? deleteConversation,
    TResult Function(int otherUserId)? getConversationBetweenUser,
    TResult Function(int blockedUserId)? blockUser,
    TResult Function(int unblockUserId)? unblockUser,
    required TResult orElse(),
  }) {
    if (setConversationFavorite != null) {
      return setConversationFavorite(conversations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetConversations value) getConversations,
    required TResult Function(_GetConversationMessage value)
        getConversationMessage,
    required TResult Function(_GetMemberInfo value) getMemberInfo,
    required TResult Function(_SendInstantMessage value) sendInstantMessage,
    required TResult Function(_ResetMessage value) resetMessage,
    required TResult Function(_GetUnreadMessageCount value)
        getUnreadMessageCount,
    required TResult Function(_SetFavoriteConversations value)
        setConversationFavorite,
    required TResult Function(_UnsetFavoriteConversations value)
        unsetConversationFavorite,
    required TResult Function(_DeleteConversation value) deleteConversation,
    required TResult Function(_GetConversationBetweenUser value)
        getConversationBetweenUser,
    required TResult Function(_BlockUser value) blockUser,
    required TResult Function(_UnblockUser value) unblockUser,
  }) {
    return setConversationFavorite(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetConversations value)? getConversations,
    TResult? Function(_GetConversationMessage value)? getConversationMessage,
    TResult? Function(_GetMemberInfo value)? getMemberInfo,
    TResult? Function(_SendInstantMessage value)? sendInstantMessage,
    TResult? Function(_ResetMessage value)? resetMessage,
    TResult? Function(_GetUnreadMessageCount value)? getUnreadMessageCount,
    TResult? Function(_SetFavoriteConversations value)? setConversationFavorite,
    TResult? Function(_UnsetFavoriteConversations value)?
        unsetConversationFavorite,
    TResult? Function(_DeleteConversation value)? deleteConversation,
    TResult? Function(_GetConversationBetweenUser value)?
        getConversationBetweenUser,
    TResult? Function(_BlockUser value)? blockUser,
    TResult? Function(_UnblockUser value)? unblockUser,
  }) {
    return setConversationFavorite?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetConversations value)? getConversations,
    TResult Function(_GetConversationMessage value)? getConversationMessage,
    TResult Function(_GetMemberInfo value)? getMemberInfo,
    TResult Function(_SendInstantMessage value)? sendInstantMessage,
    TResult Function(_ResetMessage value)? resetMessage,
    TResult Function(_GetUnreadMessageCount value)? getUnreadMessageCount,
    TResult Function(_SetFavoriteConversations value)? setConversationFavorite,
    TResult Function(_UnsetFavoriteConversations value)?
        unsetConversationFavorite,
    TResult Function(_DeleteConversation value)? deleteConversation,
    TResult Function(_GetConversationBetweenUser value)?
        getConversationBetweenUser,
    TResult Function(_BlockUser value)? blockUser,
    TResult Function(_UnblockUser value)? unblockUser,
    required TResult orElse(),
  }) {
    if (setConversationFavorite != null) {
      return setConversationFavorite(this);
    }
    return orElse();
  }
}

abstract class _SetFavoriteConversations implements ChatEvent {
  const factory _SetFavoriteConversations(final int conversations) =
      _$_SetFavoriteConversations;

  int get conversations;
  @JsonKey(ignore: true)
  _$$_SetFavoriteConversationsCopyWith<_$_SetFavoriteConversations>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UnsetFavoriteConversationsCopyWith<$Res> {
  factory _$$_UnsetFavoriteConversationsCopyWith(
          _$_UnsetFavoriteConversations value,
          $Res Function(_$_UnsetFavoriteConversations) then) =
      __$$_UnsetFavoriteConversationsCopyWithImpl<$Res>;
  @useResult
  $Res call({int conversations});
}

/// @nodoc
class __$$_UnsetFavoriteConversationsCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$_UnsetFavoriteConversations>
    implements _$$_UnsetFavoriteConversationsCopyWith<$Res> {
  __$$_UnsetFavoriteConversationsCopyWithImpl(
      _$_UnsetFavoriteConversations _value,
      $Res Function(_$_UnsetFavoriteConversations) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversations = null,
  }) {
    return _then(_$_UnsetFavoriteConversations(
      null == conversations
          ? _value.conversations
          : conversations // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_UnsetFavoriteConversations implements _UnsetFavoriteConversations {
  const _$_UnsetFavoriteConversations(this.conversations);

  @override
  final int conversations;

  @override
  String toString() {
    return 'ChatEvent.unsetConversationFavorite(conversations: $conversations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnsetFavoriteConversations &&
            (identical(other.conversations, conversations) ||
                other.conversations == conversations));
  }

  @override
  int get hashCode => Object.hash(runtimeType, conversations);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UnsetFavoriteConversationsCopyWith<_$_UnsetFavoriteConversations>
      get copyWith => __$$_UnsetFavoriteConversationsCopyWithImpl<
          _$_UnsetFavoriteConversations>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getConversations,
    required TResult Function(int conversationId) getConversationMessage,
    required TResult Function(int memberId) getMemberInfo,
    required TResult Function(int toUserId, String message) sendInstantMessage,
    required TResult Function() resetMessage,
    required TResult Function() getUnreadMessageCount,
    required TResult Function(int conversations) setConversationFavorite,
    required TResult Function(int conversations) unsetConversationFavorite,
    required TResult Function(int conversationIds) deleteConversation,
    required TResult Function(int otherUserId) getConversationBetweenUser,
    required TResult Function(int blockedUserId) blockUser,
    required TResult Function(int unblockUserId) unblockUser,
  }) {
    return unsetConversationFavorite(conversations);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getConversations,
    TResult? Function(int conversationId)? getConversationMessage,
    TResult? Function(int memberId)? getMemberInfo,
    TResult? Function(int toUserId, String message)? sendInstantMessage,
    TResult? Function()? resetMessage,
    TResult? Function()? getUnreadMessageCount,
    TResult? Function(int conversations)? setConversationFavorite,
    TResult? Function(int conversations)? unsetConversationFavorite,
    TResult? Function(int conversationIds)? deleteConversation,
    TResult? Function(int otherUserId)? getConversationBetweenUser,
    TResult? Function(int blockedUserId)? blockUser,
    TResult? Function(int unblockUserId)? unblockUser,
  }) {
    return unsetConversationFavorite?.call(conversations);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getConversations,
    TResult Function(int conversationId)? getConversationMessage,
    TResult Function(int memberId)? getMemberInfo,
    TResult Function(int toUserId, String message)? sendInstantMessage,
    TResult Function()? resetMessage,
    TResult Function()? getUnreadMessageCount,
    TResult Function(int conversations)? setConversationFavorite,
    TResult Function(int conversations)? unsetConversationFavorite,
    TResult Function(int conversationIds)? deleteConversation,
    TResult Function(int otherUserId)? getConversationBetweenUser,
    TResult Function(int blockedUserId)? blockUser,
    TResult Function(int unblockUserId)? unblockUser,
    required TResult orElse(),
  }) {
    if (unsetConversationFavorite != null) {
      return unsetConversationFavorite(conversations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetConversations value) getConversations,
    required TResult Function(_GetConversationMessage value)
        getConversationMessage,
    required TResult Function(_GetMemberInfo value) getMemberInfo,
    required TResult Function(_SendInstantMessage value) sendInstantMessage,
    required TResult Function(_ResetMessage value) resetMessage,
    required TResult Function(_GetUnreadMessageCount value)
        getUnreadMessageCount,
    required TResult Function(_SetFavoriteConversations value)
        setConversationFavorite,
    required TResult Function(_UnsetFavoriteConversations value)
        unsetConversationFavorite,
    required TResult Function(_DeleteConversation value) deleteConversation,
    required TResult Function(_GetConversationBetweenUser value)
        getConversationBetweenUser,
    required TResult Function(_BlockUser value) blockUser,
    required TResult Function(_UnblockUser value) unblockUser,
  }) {
    return unsetConversationFavorite(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetConversations value)? getConversations,
    TResult? Function(_GetConversationMessage value)? getConversationMessage,
    TResult? Function(_GetMemberInfo value)? getMemberInfo,
    TResult? Function(_SendInstantMessage value)? sendInstantMessage,
    TResult? Function(_ResetMessage value)? resetMessage,
    TResult? Function(_GetUnreadMessageCount value)? getUnreadMessageCount,
    TResult? Function(_SetFavoriteConversations value)? setConversationFavorite,
    TResult? Function(_UnsetFavoriteConversations value)?
        unsetConversationFavorite,
    TResult? Function(_DeleteConversation value)? deleteConversation,
    TResult? Function(_GetConversationBetweenUser value)?
        getConversationBetweenUser,
    TResult? Function(_BlockUser value)? blockUser,
    TResult? Function(_UnblockUser value)? unblockUser,
  }) {
    return unsetConversationFavorite?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetConversations value)? getConversations,
    TResult Function(_GetConversationMessage value)? getConversationMessage,
    TResult Function(_GetMemberInfo value)? getMemberInfo,
    TResult Function(_SendInstantMessage value)? sendInstantMessage,
    TResult Function(_ResetMessage value)? resetMessage,
    TResult Function(_GetUnreadMessageCount value)? getUnreadMessageCount,
    TResult Function(_SetFavoriteConversations value)? setConversationFavorite,
    TResult Function(_UnsetFavoriteConversations value)?
        unsetConversationFavorite,
    TResult Function(_DeleteConversation value)? deleteConversation,
    TResult Function(_GetConversationBetweenUser value)?
        getConversationBetweenUser,
    TResult Function(_BlockUser value)? blockUser,
    TResult Function(_UnblockUser value)? unblockUser,
    required TResult orElse(),
  }) {
    if (unsetConversationFavorite != null) {
      return unsetConversationFavorite(this);
    }
    return orElse();
  }
}

abstract class _UnsetFavoriteConversations implements ChatEvent {
  const factory _UnsetFavoriteConversations(final int conversations) =
      _$_UnsetFavoriteConversations;

  int get conversations;
  @JsonKey(ignore: true)
  _$$_UnsetFavoriteConversationsCopyWith<_$_UnsetFavoriteConversations>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeleteConversationCopyWith<$Res> {
  factory _$$_DeleteConversationCopyWith(_$_DeleteConversation value,
          $Res Function(_$_DeleteConversation) then) =
      __$$_DeleteConversationCopyWithImpl<$Res>;
  @useResult
  $Res call({int conversationIds});
}

/// @nodoc
class __$$_DeleteConversationCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$_DeleteConversation>
    implements _$$_DeleteConversationCopyWith<$Res> {
  __$$_DeleteConversationCopyWithImpl(
      _$_DeleteConversation _value, $Res Function(_$_DeleteConversation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversationIds = null,
  }) {
    return _then(_$_DeleteConversation(
      null == conversationIds
          ? _value.conversationIds
          : conversationIds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_DeleteConversation implements _DeleteConversation {
  const _$_DeleteConversation(this.conversationIds);

  @override
  final int conversationIds;

  @override
  String toString() {
    return 'ChatEvent.deleteConversation(conversationIds: $conversationIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteConversation &&
            (identical(other.conversationIds, conversationIds) ||
                other.conversationIds == conversationIds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, conversationIds);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteConversationCopyWith<_$_DeleteConversation> get copyWith =>
      __$$_DeleteConversationCopyWithImpl<_$_DeleteConversation>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getConversations,
    required TResult Function(int conversationId) getConversationMessage,
    required TResult Function(int memberId) getMemberInfo,
    required TResult Function(int toUserId, String message) sendInstantMessage,
    required TResult Function() resetMessage,
    required TResult Function() getUnreadMessageCount,
    required TResult Function(int conversations) setConversationFavorite,
    required TResult Function(int conversations) unsetConversationFavorite,
    required TResult Function(int conversationIds) deleteConversation,
    required TResult Function(int otherUserId) getConversationBetweenUser,
    required TResult Function(int blockedUserId) blockUser,
    required TResult Function(int unblockUserId) unblockUser,
  }) {
    return deleteConversation(conversationIds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getConversations,
    TResult? Function(int conversationId)? getConversationMessage,
    TResult? Function(int memberId)? getMemberInfo,
    TResult? Function(int toUserId, String message)? sendInstantMessage,
    TResult? Function()? resetMessage,
    TResult? Function()? getUnreadMessageCount,
    TResult? Function(int conversations)? setConversationFavorite,
    TResult? Function(int conversations)? unsetConversationFavorite,
    TResult? Function(int conversationIds)? deleteConversation,
    TResult? Function(int otherUserId)? getConversationBetweenUser,
    TResult? Function(int blockedUserId)? blockUser,
    TResult? Function(int unblockUserId)? unblockUser,
  }) {
    return deleteConversation?.call(conversationIds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getConversations,
    TResult Function(int conversationId)? getConversationMessage,
    TResult Function(int memberId)? getMemberInfo,
    TResult Function(int toUserId, String message)? sendInstantMessage,
    TResult Function()? resetMessage,
    TResult Function()? getUnreadMessageCount,
    TResult Function(int conversations)? setConversationFavorite,
    TResult Function(int conversations)? unsetConversationFavorite,
    TResult Function(int conversationIds)? deleteConversation,
    TResult Function(int otherUserId)? getConversationBetweenUser,
    TResult Function(int blockedUserId)? blockUser,
    TResult Function(int unblockUserId)? unblockUser,
    required TResult orElse(),
  }) {
    if (deleteConversation != null) {
      return deleteConversation(conversationIds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetConversations value) getConversations,
    required TResult Function(_GetConversationMessage value)
        getConversationMessage,
    required TResult Function(_GetMemberInfo value) getMemberInfo,
    required TResult Function(_SendInstantMessage value) sendInstantMessage,
    required TResult Function(_ResetMessage value) resetMessage,
    required TResult Function(_GetUnreadMessageCount value)
        getUnreadMessageCount,
    required TResult Function(_SetFavoriteConversations value)
        setConversationFavorite,
    required TResult Function(_UnsetFavoriteConversations value)
        unsetConversationFavorite,
    required TResult Function(_DeleteConversation value) deleteConversation,
    required TResult Function(_GetConversationBetweenUser value)
        getConversationBetweenUser,
    required TResult Function(_BlockUser value) blockUser,
    required TResult Function(_UnblockUser value) unblockUser,
  }) {
    return deleteConversation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetConversations value)? getConversations,
    TResult? Function(_GetConversationMessage value)? getConversationMessage,
    TResult? Function(_GetMemberInfo value)? getMemberInfo,
    TResult? Function(_SendInstantMessage value)? sendInstantMessage,
    TResult? Function(_ResetMessage value)? resetMessage,
    TResult? Function(_GetUnreadMessageCount value)? getUnreadMessageCount,
    TResult? Function(_SetFavoriteConversations value)? setConversationFavorite,
    TResult? Function(_UnsetFavoriteConversations value)?
        unsetConversationFavorite,
    TResult? Function(_DeleteConversation value)? deleteConversation,
    TResult? Function(_GetConversationBetweenUser value)?
        getConversationBetweenUser,
    TResult? Function(_BlockUser value)? blockUser,
    TResult? Function(_UnblockUser value)? unblockUser,
  }) {
    return deleteConversation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetConversations value)? getConversations,
    TResult Function(_GetConversationMessage value)? getConversationMessage,
    TResult Function(_GetMemberInfo value)? getMemberInfo,
    TResult Function(_SendInstantMessage value)? sendInstantMessage,
    TResult Function(_ResetMessage value)? resetMessage,
    TResult Function(_GetUnreadMessageCount value)? getUnreadMessageCount,
    TResult Function(_SetFavoriteConversations value)? setConversationFavorite,
    TResult Function(_UnsetFavoriteConversations value)?
        unsetConversationFavorite,
    TResult Function(_DeleteConversation value)? deleteConversation,
    TResult Function(_GetConversationBetweenUser value)?
        getConversationBetweenUser,
    TResult Function(_BlockUser value)? blockUser,
    TResult Function(_UnblockUser value)? unblockUser,
    required TResult orElse(),
  }) {
    if (deleteConversation != null) {
      return deleteConversation(this);
    }
    return orElse();
  }
}

abstract class _DeleteConversation implements ChatEvent {
  const factory _DeleteConversation(final int conversationIds) =
      _$_DeleteConversation;

  int get conversationIds;
  @JsonKey(ignore: true)
  _$$_DeleteConversationCopyWith<_$_DeleteConversation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetConversationBetweenUserCopyWith<$Res> {
  factory _$$_GetConversationBetweenUserCopyWith(
          _$_GetConversationBetweenUser value,
          $Res Function(_$_GetConversationBetweenUser) then) =
      __$$_GetConversationBetweenUserCopyWithImpl<$Res>;
  @useResult
  $Res call({int otherUserId});
}

/// @nodoc
class __$$_GetConversationBetweenUserCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$_GetConversationBetweenUser>
    implements _$$_GetConversationBetweenUserCopyWith<$Res> {
  __$$_GetConversationBetweenUserCopyWithImpl(
      _$_GetConversationBetweenUser _value,
      $Res Function(_$_GetConversationBetweenUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otherUserId = null,
  }) {
    return _then(_$_GetConversationBetweenUser(
      null == otherUserId
          ? _value.otherUserId
          : otherUserId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GetConversationBetweenUser implements _GetConversationBetweenUser {
  const _$_GetConversationBetweenUser(this.otherUserId);

  @override
  final int otherUserId;

  @override
  String toString() {
    return 'ChatEvent.getConversationBetweenUser(otherUserId: $otherUserId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetConversationBetweenUser &&
            (identical(other.otherUserId, otherUserId) ||
                other.otherUserId == otherUserId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, otherUserId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetConversationBetweenUserCopyWith<_$_GetConversationBetweenUser>
      get copyWith => __$$_GetConversationBetweenUserCopyWithImpl<
          _$_GetConversationBetweenUser>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getConversations,
    required TResult Function(int conversationId) getConversationMessage,
    required TResult Function(int memberId) getMemberInfo,
    required TResult Function(int toUserId, String message) sendInstantMessage,
    required TResult Function() resetMessage,
    required TResult Function() getUnreadMessageCount,
    required TResult Function(int conversations) setConversationFavorite,
    required TResult Function(int conversations) unsetConversationFavorite,
    required TResult Function(int conversationIds) deleteConversation,
    required TResult Function(int otherUserId) getConversationBetweenUser,
    required TResult Function(int blockedUserId) blockUser,
    required TResult Function(int unblockUserId) unblockUser,
  }) {
    return getConversationBetweenUser(otherUserId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getConversations,
    TResult? Function(int conversationId)? getConversationMessage,
    TResult? Function(int memberId)? getMemberInfo,
    TResult? Function(int toUserId, String message)? sendInstantMessage,
    TResult? Function()? resetMessage,
    TResult? Function()? getUnreadMessageCount,
    TResult? Function(int conversations)? setConversationFavorite,
    TResult? Function(int conversations)? unsetConversationFavorite,
    TResult? Function(int conversationIds)? deleteConversation,
    TResult? Function(int otherUserId)? getConversationBetweenUser,
    TResult? Function(int blockedUserId)? blockUser,
    TResult? Function(int unblockUserId)? unblockUser,
  }) {
    return getConversationBetweenUser?.call(otherUserId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getConversations,
    TResult Function(int conversationId)? getConversationMessage,
    TResult Function(int memberId)? getMemberInfo,
    TResult Function(int toUserId, String message)? sendInstantMessage,
    TResult Function()? resetMessage,
    TResult Function()? getUnreadMessageCount,
    TResult Function(int conversations)? setConversationFavorite,
    TResult Function(int conversations)? unsetConversationFavorite,
    TResult Function(int conversationIds)? deleteConversation,
    TResult Function(int otherUserId)? getConversationBetweenUser,
    TResult Function(int blockedUserId)? blockUser,
    TResult Function(int unblockUserId)? unblockUser,
    required TResult orElse(),
  }) {
    if (getConversationBetweenUser != null) {
      return getConversationBetweenUser(otherUserId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetConversations value) getConversations,
    required TResult Function(_GetConversationMessage value)
        getConversationMessage,
    required TResult Function(_GetMemberInfo value) getMemberInfo,
    required TResult Function(_SendInstantMessage value) sendInstantMessage,
    required TResult Function(_ResetMessage value) resetMessage,
    required TResult Function(_GetUnreadMessageCount value)
        getUnreadMessageCount,
    required TResult Function(_SetFavoriteConversations value)
        setConversationFavorite,
    required TResult Function(_UnsetFavoriteConversations value)
        unsetConversationFavorite,
    required TResult Function(_DeleteConversation value) deleteConversation,
    required TResult Function(_GetConversationBetweenUser value)
        getConversationBetweenUser,
    required TResult Function(_BlockUser value) blockUser,
    required TResult Function(_UnblockUser value) unblockUser,
  }) {
    return getConversationBetweenUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetConversations value)? getConversations,
    TResult? Function(_GetConversationMessage value)? getConversationMessage,
    TResult? Function(_GetMemberInfo value)? getMemberInfo,
    TResult? Function(_SendInstantMessage value)? sendInstantMessage,
    TResult? Function(_ResetMessage value)? resetMessage,
    TResult? Function(_GetUnreadMessageCount value)? getUnreadMessageCount,
    TResult? Function(_SetFavoriteConversations value)? setConversationFavorite,
    TResult? Function(_UnsetFavoriteConversations value)?
        unsetConversationFavorite,
    TResult? Function(_DeleteConversation value)? deleteConversation,
    TResult? Function(_GetConversationBetweenUser value)?
        getConversationBetweenUser,
    TResult? Function(_BlockUser value)? blockUser,
    TResult? Function(_UnblockUser value)? unblockUser,
  }) {
    return getConversationBetweenUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetConversations value)? getConversations,
    TResult Function(_GetConversationMessage value)? getConversationMessage,
    TResult Function(_GetMemberInfo value)? getMemberInfo,
    TResult Function(_SendInstantMessage value)? sendInstantMessage,
    TResult Function(_ResetMessage value)? resetMessage,
    TResult Function(_GetUnreadMessageCount value)? getUnreadMessageCount,
    TResult Function(_SetFavoriteConversations value)? setConversationFavorite,
    TResult Function(_UnsetFavoriteConversations value)?
        unsetConversationFavorite,
    TResult Function(_DeleteConversation value)? deleteConversation,
    TResult Function(_GetConversationBetweenUser value)?
        getConversationBetweenUser,
    TResult Function(_BlockUser value)? blockUser,
    TResult Function(_UnblockUser value)? unblockUser,
    required TResult orElse(),
  }) {
    if (getConversationBetweenUser != null) {
      return getConversationBetweenUser(this);
    }
    return orElse();
  }
}

abstract class _GetConversationBetweenUser implements ChatEvent {
  const factory _GetConversationBetweenUser(final int otherUserId) =
      _$_GetConversationBetweenUser;

  int get otherUserId;
  @JsonKey(ignore: true)
  _$$_GetConversationBetweenUserCopyWith<_$_GetConversationBetweenUser>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BlockUserCopyWith<$Res> {
  factory _$$_BlockUserCopyWith(
          _$_BlockUser value, $Res Function(_$_BlockUser) then) =
      __$$_BlockUserCopyWithImpl<$Res>;
  @useResult
  $Res call({int blockedUserId});
}

/// @nodoc
class __$$_BlockUserCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$_BlockUser>
    implements _$$_BlockUserCopyWith<$Res> {
  __$$_BlockUserCopyWithImpl(
      _$_BlockUser _value, $Res Function(_$_BlockUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockedUserId = null,
  }) {
    return _then(_$_BlockUser(
      null == blockedUserId
          ? _value.blockedUserId
          : blockedUserId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_BlockUser implements _BlockUser {
  const _$_BlockUser(this.blockedUserId);

  @override
  final int blockedUserId;

  @override
  String toString() {
    return 'ChatEvent.blockUser(blockedUserId: $blockedUserId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BlockUser &&
            (identical(other.blockedUserId, blockedUserId) ||
                other.blockedUserId == blockedUserId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, blockedUserId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BlockUserCopyWith<_$_BlockUser> get copyWith =>
      __$$_BlockUserCopyWithImpl<_$_BlockUser>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getConversations,
    required TResult Function(int conversationId) getConversationMessage,
    required TResult Function(int memberId) getMemberInfo,
    required TResult Function(int toUserId, String message) sendInstantMessage,
    required TResult Function() resetMessage,
    required TResult Function() getUnreadMessageCount,
    required TResult Function(int conversations) setConversationFavorite,
    required TResult Function(int conversations) unsetConversationFavorite,
    required TResult Function(int conversationIds) deleteConversation,
    required TResult Function(int otherUserId) getConversationBetweenUser,
    required TResult Function(int blockedUserId) blockUser,
    required TResult Function(int unblockUserId) unblockUser,
  }) {
    return blockUser(blockedUserId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getConversations,
    TResult? Function(int conversationId)? getConversationMessage,
    TResult? Function(int memberId)? getMemberInfo,
    TResult? Function(int toUserId, String message)? sendInstantMessage,
    TResult? Function()? resetMessage,
    TResult? Function()? getUnreadMessageCount,
    TResult? Function(int conversations)? setConversationFavorite,
    TResult? Function(int conversations)? unsetConversationFavorite,
    TResult? Function(int conversationIds)? deleteConversation,
    TResult? Function(int otherUserId)? getConversationBetweenUser,
    TResult? Function(int blockedUserId)? blockUser,
    TResult? Function(int unblockUserId)? unblockUser,
  }) {
    return blockUser?.call(blockedUserId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getConversations,
    TResult Function(int conversationId)? getConversationMessage,
    TResult Function(int memberId)? getMemberInfo,
    TResult Function(int toUserId, String message)? sendInstantMessage,
    TResult Function()? resetMessage,
    TResult Function()? getUnreadMessageCount,
    TResult Function(int conversations)? setConversationFavorite,
    TResult Function(int conversations)? unsetConversationFavorite,
    TResult Function(int conversationIds)? deleteConversation,
    TResult Function(int otherUserId)? getConversationBetweenUser,
    TResult Function(int blockedUserId)? blockUser,
    TResult Function(int unblockUserId)? unblockUser,
    required TResult orElse(),
  }) {
    if (blockUser != null) {
      return blockUser(blockedUserId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetConversations value) getConversations,
    required TResult Function(_GetConversationMessage value)
        getConversationMessage,
    required TResult Function(_GetMemberInfo value) getMemberInfo,
    required TResult Function(_SendInstantMessage value) sendInstantMessage,
    required TResult Function(_ResetMessage value) resetMessage,
    required TResult Function(_GetUnreadMessageCount value)
        getUnreadMessageCount,
    required TResult Function(_SetFavoriteConversations value)
        setConversationFavorite,
    required TResult Function(_UnsetFavoriteConversations value)
        unsetConversationFavorite,
    required TResult Function(_DeleteConversation value) deleteConversation,
    required TResult Function(_GetConversationBetweenUser value)
        getConversationBetweenUser,
    required TResult Function(_BlockUser value) blockUser,
    required TResult Function(_UnblockUser value) unblockUser,
  }) {
    return blockUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetConversations value)? getConversations,
    TResult? Function(_GetConversationMessage value)? getConversationMessage,
    TResult? Function(_GetMemberInfo value)? getMemberInfo,
    TResult? Function(_SendInstantMessage value)? sendInstantMessage,
    TResult? Function(_ResetMessage value)? resetMessage,
    TResult? Function(_GetUnreadMessageCount value)? getUnreadMessageCount,
    TResult? Function(_SetFavoriteConversations value)? setConversationFavorite,
    TResult? Function(_UnsetFavoriteConversations value)?
        unsetConversationFavorite,
    TResult? Function(_DeleteConversation value)? deleteConversation,
    TResult? Function(_GetConversationBetweenUser value)?
        getConversationBetweenUser,
    TResult? Function(_BlockUser value)? blockUser,
    TResult? Function(_UnblockUser value)? unblockUser,
  }) {
    return blockUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetConversations value)? getConversations,
    TResult Function(_GetConversationMessage value)? getConversationMessage,
    TResult Function(_GetMemberInfo value)? getMemberInfo,
    TResult Function(_SendInstantMessage value)? sendInstantMessage,
    TResult Function(_ResetMessage value)? resetMessage,
    TResult Function(_GetUnreadMessageCount value)? getUnreadMessageCount,
    TResult Function(_SetFavoriteConversations value)? setConversationFavorite,
    TResult Function(_UnsetFavoriteConversations value)?
        unsetConversationFavorite,
    TResult Function(_DeleteConversation value)? deleteConversation,
    TResult Function(_GetConversationBetweenUser value)?
        getConversationBetweenUser,
    TResult Function(_BlockUser value)? blockUser,
    TResult Function(_UnblockUser value)? unblockUser,
    required TResult orElse(),
  }) {
    if (blockUser != null) {
      return blockUser(this);
    }
    return orElse();
  }
}

abstract class _BlockUser implements ChatEvent {
  const factory _BlockUser(final int blockedUserId) = _$_BlockUser;

  int get blockedUserId;
  @JsonKey(ignore: true)
  _$$_BlockUserCopyWith<_$_BlockUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UnblockUserCopyWith<$Res> {
  factory _$$_UnblockUserCopyWith(
          _$_UnblockUser value, $Res Function(_$_UnblockUser) then) =
      __$$_UnblockUserCopyWithImpl<$Res>;
  @useResult
  $Res call({int unblockUserId});
}

/// @nodoc
class __$$_UnblockUserCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$_UnblockUser>
    implements _$$_UnblockUserCopyWith<$Res> {
  __$$_UnblockUserCopyWithImpl(
      _$_UnblockUser _value, $Res Function(_$_UnblockUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unblockUserId = null,
  }) {
    return _then(_$_UnblockUser(
      null == unblockUserId
          ? _value.unblockUserId
          : unblockUserId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_UnblockUser implements _UnblockUser {
  const _$_UnblockUser(this.unblockUserId);

  @override
  final int unblockUserId;

  @override
  String toString() {
    return 'ChatEvent.unblockUser(unblockUserId: $unblockUserId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnblockUser &&
            (identical(other.unblockUserId, unblockUserId) ||
                other.unblockUserId == unblockUserId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, unblockUserId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UnblockUserCopyWith<_$_UnblockUser> get copyWith =>
      __$$_UnblockUserCopyWithImpl<_$_UnblockUser>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getConversations,
    required TResult Function(int conversationId) getConversationMessage,
    required TResult Function(int memberId) getMemberInfo,
    required TResult Function(int toUserId, String message) sendInstantMessage,
    required TResult Function() resetMessage,
    required TResult Function() getUnreadMessageCount,
    required TResult Function(int conversations) setConversationFavorite,
    required TResult Function(int conversations) unsetConversationFavorite,
    required TResult Function(int conversationIds) deleteConversation,
    required TResult Function(int otherUserId) getConversationBetweenUser,
    required TResult Function(int blockedUserId) blockUser,
    required TResult Function(int unblockUserId) unblockUser,
  }) {
    return unblockUser(unblockUserId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getConversations,
    TResult? Function(int conversationId)? getConversationMessage,
    TResult? Function(int memberId)? getMemberInfo,
    TResult? Function(int toUserId, String message)? sendInstantMessage,
    TResult? Function()? resetMessage,
    TResult? Function()? getUnreadMessageCount,
    TResult? Function(int conversations)? setConversationFavorite,
    TResult? Function(int conversations)? unsetConversationFavorite,
    TResult? Function(int conversationIds)? deleteConversation,
    TResult? Function(int otherUserId)? getConversationBetweenUser,
    TResult? Function(int blockedUserId)? blockUser,
    TResult? Function(int unblockUserId)? unblockUser,
  }) {
    return unblockUser?.call(unblockUserId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getConversations,
    TResult Function(int conversationId)? getConversationMessage,
    TResult Function(int memberId)? getMemberInfo,
    TResult Function(int toUserId, String message)? sendInstantMessage,
    TResult Function()? resetMessage,
    TResult Function()? getUnreadMessageCount,
    TResult Function(int conversations)? setConversationFavorite,
    TResult Function(int conversations)? unsetConversationFavorite,
    TResult Function(int conversationIds)? deleteConversation,
    TResult Function(int otherUserId)? getConversationBetweenUser,
    TResult Function(int blockedUserId)? blockUser,
    TResult Function(int unblockUserId)? unblockUser,
    required TResult orElse(),
  }) {
    if (unblockUser != null) {
      return unblockUser(unblockUserId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetConversations value) getConversations,
    required TResult Function(_GetConversationMessage value)
        getConversationMessage,
    required TResult Function(_GetMemberInfo value) getMemberInfo,
    required TResult Function(_SendInstantMessage value) sendInstantMessage,
    required TResult Function(_ResetMessage value) resetMessage,
    required TResult Function(_GetUnreadMessageCount value)
        getUnreadMessageCount,
    required TResult Function(_SetFavoriteConversations value)
        setConversationFavorite,
    required TResult Function(_UnsetFavoriteConversations value)
        unsetConversationFavorite,
    required TResult Function(_DeleteConversation value) deleteConversation,
    required TResult Function(_GetConversationBetweenUser value)
        getConversationBetweenUser,
    required TResult Function(_BlockUser value) blockUser,
    required TResult Function(_UnblockUser value) unblockUser,
  }) {
    return unblockUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetConversations value)? getConversations,
    TResult? Function(_GetConversationMessage value)? getConversationMessage,
    TResult? Function(_GetMemberInfo value)? getMemberInfo,
    TResult? Function(_SendInstantMessage value)? sendInstantMessage,
    TResult? Function(_ResetMessage value)? resetMessage,
    TResult? Function(_GetUnreadMessageCount value)? getUnreadMessageCount,
    TResult? Function(_SetFavoriteConversations value)? setConversationFavorite,
    TResult? Function(_UnsetFavoriteConversations value)?
        unsetConversationFavorite,
    TResult? Function(_DeleteConversation value)? deleteConversation,
    TResult? Function(_GetConversationBetweenUser value)?
        getConversationBetweenUser,
    TResult? Function(_BlockUser value)? blockUser,
    TResult? Function(_UnblockUser value)? unblockUser,
  }) {
    return unblockUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetConversations value)? getConversations,
    TResult Function(_GetConversationMessage value)? getConversationMessage,
    TResult Function(_GetMemberInfo value)? getMemberInfo,
    TResult Function(_SendInstantMessage value)? sendInstantMessage,
    TResult Function(_ResetMessage value)? resetMessage,
    TResult Function(_GetUnreadMessageCount value)? getUnreadMessageCount,
    TResult Function(_SetFavoriteConversations value)? setConversationFavorite,
    TResult Function(_UnsetFavoriteConversations value)?
        unsetConversationFavorite,
    TResult Function(_DeleteConversation value)? deleteConversation,
    TResult Function(_GetConversationBetweenUser value)?
        getConversationBetweenUser,
    TResult Function(_BlockUser value)? blockUser,
    TResult Function(_UnblockUser value)? unblockUser,
    required TResult orElse(),
  }) {
    if (unblockUser != null) {
      return unblockUser(this);
    }
    return orElse();
  }
}

abstract class _UnblockUser implements ChatEvent {
  const factory _UnblockUser(final int unblockUserId) = _$_UnblockUser;

  int get unblockUserId;
  @JsonKey(ignore: true)
  _$$_UnblockUserCopyWith<_$_UnblockUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChatState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Object data) loaded,
    required TResult Function() loadedWithoutData,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Object data)? loaded,
    TResult? Function()? loadedWithoutData,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Object data)? loaded,
    TResult Function()? loadedWithoutData,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadedWithoutData value) loadedWithoutData,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadedWithoutData value)? loadedWithoutData,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadedWithoutData value)? loadedWithoutData,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res, ChatState>;
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res, $Val extends ChatState>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'ChatState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Object data) loaded,
    required TResult Function() loadedWithoutData,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Object data)? loaded,
    TResult? Function()? loadedWithoutData,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Object data)? loaded,
    TResult Function()? loadedWithoutData,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadedWithoutData value) loadedWithoutData,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadedWithoutData value)? loadedWithoutData,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadedWithoutData value)? loadedWithoutData,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ChatState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'ChatState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Object data) loaded,
    required TResult Function() loadedWithoutData,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Object data)? loaded,
    TResult? Function()? loadedWithoutData,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Object data)? loaded,
    TResult Function()? loadedWithoutData,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadedWithoutData value) loadedWithoutData,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadedWithoutData value)? loadedWithoutData,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadedWithoutData value)? loadedWithoutData,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ChatState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_LoadedCopyWith<$Res> {
  factory _$$_LoadedCopyWith(_$_Loaded value, $Res Function(_$_Loaded) then) =
      __$$_LoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({Object data});
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$_Loaded>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_Loaded(
      null == data ? _value.data : data,
    ));
  }
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded(this.data);

  @override
  final Object data;

  @override
  String toString() {
    return 'ChatState.loaded(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loaded &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      __$$_LoadedCopyWithImpl<_$_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Object data) loaded,
    required TResult Function() loadedWithoutData,
    required TResult Function(String message) error,
  }) {
    return loaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Object data)? loaded,
    TResult? Function()? loadedWithoutData,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Object data)? loaded,
    TResult Function()? loadedWithoutData,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadedWithoutData value) loadedWithoutData,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadedWithoutData value)? loadedWithoutData,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadedWithoutData value)? loadedWithoutData,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements ChatState {
  const factory _Loaded(final Object data) = _$_Loaded;

  Object get data;
  @JsonKey(ignore: true)
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadedWithoutDataCopyWith<$Res> {
  factory _$$_LoadedWithoutDataCopyWith(_$_LoadedWithoutData value,
          $Res Function(_$_LoadedWithoutData) then) =
      __$$_LoadedWithoutDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadedWithoutDataCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$_LoadedWithoutData>
    implements _$$_LoadedWithoutDataCopyWith<$Res> {
  __$$_LoadedWithoutDataCopyWithImpl(
      _$_LoadedWithoutData _value, $Res Function(_$_LoadedWithoutData) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoadedWithoutData implements _LoadedWithoutData {
  const _$_LoadedWithoutData();

  @override
  String toString() {
    return 'ChatState.loadedWithoutData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoadedWithoutData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Object data) loaded,
    required TResult Function() loadedWithoutData,
    required TResult Function(String message) error,
  }) {
    return loadedWithoutData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Object data)? loaded,
    TResult? Function()? loadedWithoutData,
    TResult? Function(String message)? error,
  }) {
    return loadedWithoutData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Object data)? loaded,
    TResult Function()? loadedWithoutData,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loadedWithoutData != null) {
      return loadedWithoutData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadedWithoutData value) loadedWithoutData,
    required TResult Function(_Error value) error,
  }) {
    return loadedWithoutData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadedWithoutData value)? loadedWithoutData,
    TResult? Function(_Error value)? error,
  }) {
    return loadedWithoutData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadedWithoutData value)? loadedWithoutData,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loadedWithoutData != null) {
      return loadedWithoutData(this);
    }
    return orElse();
  }
}

abstract class _LoadedWithoutData implements ChatState {
  const factory _LoadedWithoutData() = _$_LoadedWithoutData;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_Error(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ChatState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Object data) loaded,
    required TResult Function() loadedWithoutData,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Object data)? loaded,
    TResult? Function()? loadedWithoutData,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Object data)? loaded,
    TResult Function()? loadedWithoutData,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadedWithoutData value) loadedWithoutData,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadedWithoutData value)? loadedWithoutData,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadedWithoutData value)? loadedWithoutData,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ChatState {
  const factory _Error(final String message) = _$_Error;

  String get message;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
