import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:lms_pptik/src/data/models/item_model.dart';
import 'package:lms_pptik/src/utils/failures.dart';

import '../../repositories/upload_repository.dart';

class UploadFile {
  final UploadRepository uploadRepositoryImpl;

  UploadFile(this.uploadRepositoryImpl);

  Future<Either<Failure, List<ItemModel>>> execute(List<File> files) async {
    return await uploadRepositoryImpl.uploadFile(files);
  }
}
