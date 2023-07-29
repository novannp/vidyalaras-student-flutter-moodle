part of 'upload_file_bloc.dart';

@freezed
class UploadFileState with _$UploadFileState {
  const factory UploadFileState.initial() = _Initial;
  const factory UploadFileState.loading() = _Loading;
  const factory UploadFileState.loaded(List<ItemModel> data) = _Loaded;
  const factory UploadFileState.error(String message) = _Error;
}
