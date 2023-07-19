import 'package:dartz/dartz.dart';

import '../../data/models/event_model.dart';
import '../../utils/failures.dart';

abstract class CalendarRepository {
  Future<Either<Failure, List<EventModel>>> getAllEvent();
}
