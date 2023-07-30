import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../data/models/item_model.dart';
import '../../utils/failures.dart';

abstract class UploadRepository {
  Future<Either<Failure, List<ItemModel>>> uploadFile(File file);
}
