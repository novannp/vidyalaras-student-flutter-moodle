part of 'chat_bloc.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState.initial() = _Initial;
  const factory ChatState.loading() = _Loading;
  const factory ChatState.loaded(Object data) = _Loaded;
  const factory ChatState.loadedWithoutData() = _LoadedWithoutData;
  const factory ChatState.error(String message) = _Error;
}
