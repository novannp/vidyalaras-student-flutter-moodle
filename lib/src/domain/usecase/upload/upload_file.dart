import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:lms_pptik/src/data/models/item_model.dart';
import 'package:lms_pptik/src/data/repositories/upload_repository_impl.dart';
import 'package:lms_pptik/src/utils/failures.dart';

class UploadFile {
  final UploadRepositoryImpl uploadRepositoryImpl;

  UploadFile(this.uploadRepositoryImpl);

  Future<Either<Failure, List<ItemModel>>> execute(File file) async {
    return await uploadRepositoryImpl.uploadFile(file);
  }
}
