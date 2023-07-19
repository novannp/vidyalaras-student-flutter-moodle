import 'package:dartz/dartz.dart';

import '../../../data/models/event_model.dart';
import '../../../data/repositories/calendar_repository_impl.dart';
import '../../../utils/failures.dart';

class GetAllEvent {
  final CalendarRepositoryImpl _calendarRepositoryImpl;

  GetAllEvent(this._calendarRepositoryImpl);

  Future<Either<Failure, List<EventModel>>> execute() async {
    return await _calendarRepositoryImpl.getAllEvent();
  }
}
