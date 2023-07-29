import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/usecase/chat/chat.dart';

part 'chat_event.dart';

part 'chat_state.dart';

part 'chat_bloc.freezed.dart';

class GetConversationsBloc extends Bloc<ChatEvent, ChatState> {
  final GetConversations _getConversations;

  GetConversationsBloc(this._getConversations)
      : super(const ChatState.initial()) {
    on<ChatEvent>((event, emit) async {
      await event.whenOrNull(
        getConversations: () async {
          emit(const ChatState.loading());
          final result = await _getConversations.execute();
          result.fold(
            (failure) => emit(ChatState.error(failure.message)),
            (data) => emit(ChatState.loaded(data)),
          );
        },
      );
    });
  }
}

class GetConversationMessageBloc extends Bloc<ChatEvent, ChatState> {
  final GetConversationMessage _getConversationMessage;

  GetConversationMessageBloc(this._getConversationMessage)
      : super(const ChatState.initial()) {
    on<ChatEvent>((event, emit) async {
      await event.whenOrNull(
        resetMessage: () {
          emit(const ChatState.initial());
        },
        getConversationMessage: (conversationId) async {
          final result = await _getConversationMessage.execute(conversationId);
          result.fold(
            (failure) => emit(ChatState.error(failure.message)),
            (data) => emit(ChatState.loaded(data)),
          );
        },
      );
    });
  }
}

class GetMemberInfoBloc extends Bloc<ChatEvent, ChatState> {
  final GetMemberInfo _getMemberInfo;

  GetMemberInfoBloc(this._getMemberInfo) : super(const ChatState.initial()) {
    on<ChatEvent>((event, emit) async {
      await event.whenOrNull(
        getMemberInfo: (memberId) async {
          emit(const ChatState.loading());
          final result = await _getMemberInfo.execute(memberId);
          result.fold(
            (failure) => emit(ChatState.error(failure.message)),
            (data) => emit(ChatState.loaded(data)),
          );
        },
      );
    });
  }
}

class SendInstantMessageBloc extends Bloc<ChatEvent, ChatState> {
  final SendInstantMessage _sendInstantMessage;

  SendInstantMessageBloc(this._sendInstantMessage)
      : super(const ChatState.initial()) {
    on<ChatEvent>((event, emit) async {
      await event.whenOrNull(
        sendInstantMessage: (toUserId, message) async {
          emit(const ChatState.loading());
          final result = await _sendInstantMessage.execute(
              receiverId: toUserId, message: message);
          result.fold(
            (failure) => emit(ChatState.error(failure.message)),
            (data) => emit(ChatState.loaded(data)),
          );
        },
      );
    });
  }
}

class GetUnreadMessageCountBloc extends Bloc<ChatEvent, ChatState> {
  final GetUnreadMessageCount _getUnreadMessageCount;

  GetUnreadMessageCountBloc(this._getUnreadMessageCount)
      : super(const ChatState.initial()) {
    on<ChatEvent>((event, emit) async {
      await event.whenOrNull(
        getUnreadMessageCount: () async {
          emit(const ChatState.loading());
          final result = await _getUnreadMessageCount.execute();
          result.fold(
            (failure) => emit(ChatState.error(failure.message)),
            (data) => emit(ChatState.loaded(data)),
          );
        },
      );
    });
  }
}

class SetConversationsFavoriteBloc extends Bloc<ChatEvent, ChatState> {
  final SetConversationsFavorite _setConversationsFavorite;

  SetConversationsFavoriteBloc(this._setConversationsFavorite)
      : super(const ChatState.initial()) {
    on<ChatEvent>((event, emit) async {
      await event.whenOrNull(setConversationFavorite: (conversations) async {
        emit(const ChatState.loading());
        final result = await _setConversationsFavorite.execute(conversations);
        result.fold(
              (failure) => emit(ChatState.error(failure.message)),
              (status) => emit(ChatState.loaded(status)),
        );
      });
    });
  }
}

class DeleteConversationBloc extends Bloc<ChatEvent, ChatState> {
  final DeleteConversation _deleteConversation;

  DeleteConversationBloc(this._deleteConversation)
      : super(const ChatState.initial()) {
    on<ChatEvent>((event, emit) async {
      await event.whenOrNull(deleteConversation: (conversationIds) async {
        emit(const ChatState.loading());
        final result = await _deleteConversation.execute(conversationIds);
        result.fold(
          (failure) => emit(ChatState.error(failure.message)),
          (status) => emit(ChatState.loaded(status)),
        );
      });
    });
  }
}

class GetConversationBetweenUserBloc extends Bloc<ChatEvent, ChatState> {
  final GetConversationsBetweenUser _getConversationsBetweenUser;

  GetConversationBetweenUserBloc(this._getConversationsBetweenUser)
      : super(const ChatState.initial()) {
    on<ChatEvent>((event, emit) async {
      await event.whenOrNull(getConversationBetweenUser: (otherUserId) async {
        emit(const ChatState.loading());
        final result = await _getConversationsBetweenUser.execute(otherUserId);
        result.fold(
          (failure) => emit(ChatState.error(failure.message)),
          (data) => emit(ChatState.loaded(data)),
        );
      });
    });
  }
}
