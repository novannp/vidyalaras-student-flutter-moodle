part of 'calendar_bloc.dart';

@freezed
class CalendarEvent with _$CalendarEvent {
  const factory CalendarEvent.getAllEvent() = _GetAllEvent;
  const factory CalendarEvent.addEvent(EventModel event, int repeat) =
      _AddEvent;
  const factory CalendarEvent.deleteEvent(int eventId, bool deleteAllRepeated) =
      _UpdateEvent;
}
