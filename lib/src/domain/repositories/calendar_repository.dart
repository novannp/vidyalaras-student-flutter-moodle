import 'package:dartz/dartz.dart';

import '../../data/models/event_model.dart';
import '../../utils/failures.dart';

abstract class CalendarRepository {
  Future<Either<Failure, List<EventModel>>> getAllEvent();
  Future<Either<Failure, bool>> addEvent(EventModel event, int repeat);
  Future<Either<Failure, bool>> deleteEvent(
      int eventId, bool deleteAllRepeated);
  Future<Either<Failure, String>> exportEvents(String time);
}
