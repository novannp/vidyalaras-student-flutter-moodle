import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:lms_pptik/src/data/models/lesson_model/lesson.dart';

import '../../../domain/repositories/mods_repository.dart';
import '../../../utils/exceptions.dart';
import '../../../utils/failures.dart';
import '../../../utils/helper/secure_storage/secure_storage.dart';
import '../../data_sources/mod_apis/mod_apis.dart';
import '../../models/assignment/assignment.dart';
import '../../models/resource_model/resource.dart';
import '../../models/submission_status_model.dart';

part 'mod_assign_repository_impl.dart';
part 'mod_resource_repository_impl.dart';
part 'mod_lesson_repository_impl.dart';
