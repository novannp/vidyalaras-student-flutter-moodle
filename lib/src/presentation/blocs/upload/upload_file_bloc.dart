import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lms_pptik/src/domain/usecase/upload/upload_file.dart';

import '../../../data/models/item_model.dart';

part 'upload_file_event.dart';
part 'upload_file_state.dart';
part 'upload_file_bloc.freezed.dart';

class UploadFileBloc extends Bloc<UploadFileEvent, UploadFileState> {
  final UploadFile _uploadFile;
  UploadFileBloc(this._uploadFile) : super(const UploadFileState.initial()) {
    on<UploadFileEvent>((event, emit) async {
      await event.whenOrNull(
        uploadFile: (file) async {
          emit(const UploadFileState.loading());
          final result = await _uploadFile.execute(file);
          result.fold(
            (failure) => emit(UploadFileState.error(failure.message)),
            (data) => emit(UploadFileState.loaded(data)),
          );
        },
      );
    });
  }
}
