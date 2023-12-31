import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:lms_pptik/src/data/models/pages.dart';
import 'package:lms_pptik/src/data/models/submission_status_model.dart';
import 'package:lms_pptik/src/utils/endpoints.dart';

import '../../../utils/exceptions.dart';
import '../../models/assignment/assignment.dart';
import '../../models/resource_model/resource.dart';
import 'package:lms_pptik/src/data/models/lesson_model/lesson.dart';

part 'mod_assign_api.dart';
part 'mod_resource_api.dart';
part 'mod_lesson_api.dart';
