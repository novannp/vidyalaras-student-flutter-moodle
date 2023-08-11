part of 'calendar.dart';

class GetAllEvent {
  final CalendarRepository _calendarRepositoryImpl;

  GetAllEvent(this._calendarRepositoryImpl);

  Future<Either<Failure, List<EventModel>>> execute() async {
    return await _calendarRepositoryImpl.getAllEvent();
  }
}
