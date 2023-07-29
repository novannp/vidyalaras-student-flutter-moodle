import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:lms_pptik/src/data/data_sources/upload_api.dart';
import 'package:lms_pptik/src/utils/exceptions.dart';
import 'package:lms_pptik/src/utils/helper/secure_storage/secure_storage.dart';

import '../../data/models/item_model.dart';
import '../../utils/failures.dart';

abstract class UploadRepository {
  Future<Either<Failure, List<ItemModel>>> uploadFile(File file);
}
