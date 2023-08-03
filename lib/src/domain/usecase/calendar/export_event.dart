part of 'calendar.dart';

class ExportEvent {
  final CalendarRepositoryImpl _calendarRepository;

  ExportEvent(this._calendarRepository);

  Future<Either<Failure, String>> execute(String time) async {
    return await _calendarRepository.exportEvents(time);
  }
}
