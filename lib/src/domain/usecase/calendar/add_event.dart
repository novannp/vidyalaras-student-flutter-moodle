part of 'calendar.dart';

class AddEvent {
  final CalendarRepository _calendarRepository;

  AddEvent(this._calendarRepository);

  Future<Either<Failure, bool>> execute(EventModel event, int repeat) async {
    return await _calendarRepository.addEvent(event, repeat);
  }
}
