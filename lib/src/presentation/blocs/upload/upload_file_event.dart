part of 'upload_file_bloc.dart';

@freezed
class UploadFileEvent with _$UploadFileEvent {
  const factory UploadFileEvent.uploadFile(List<File> file) = _UploadFile;
}
