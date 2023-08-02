import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/event_model.dart';
import '../../../domain/usecase/calendar/calendar.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';
part 'calendar_bloc.freezed.dart';

class GetEventBloc extends Bloc<CalendarEvent, CalendarState> {
  final GetAllEvent _getAllEvent;
  GetEventBloc(this._getAllEvent) : super(const CalendarState.initial()) {
    on<CalendarEvent>((event, emit) async {
      await event.whenOrNull(
        getAllEvent: () async {
          emit(const CalendarState.loading());
          final result = await _getAllEvent.execute();
          result.fold(
            (l) => emit(CalendarState.error(l.message)),
            (r) => emit(CalendarState.loaded(r)),
          );
        },
      );
    });
  }
}

class AddEventBloc extends Bloc<CalendarEvent, CalendarState> {
  final AddEvent _addEvent;
  AddEventBloc(this._addEvent) : super(const CalendarState.initial()) {
    on<CalendarEvent>((event, emit) async {
      await event.whenOrNull(
        addEvent: (event, repeat) async {
          emit(const CalendarState.loading());
          final result = await _addEvent.execute(event, repeat);
          result.fold(
            (l) => emit(CalendarState.error(l.message)),
            (r) => emit(CalendarState.loaded(r)),
          );
        },
      );
    });
  }
}

class DeleteEventBloc extends Bloc<CalendarEvent, CalendarState> {
  final DeleteEvent _deleteEvent;
  DeleteEventBloc(this._deleteEvent) : super(const CalendarState.initial()) {
    on<CalendarEvent>((event, emit) async {
      await event.whenOrNull(
        deleteEvent: (eventId, deleteAllRepeated) async {
          emit(const CalendarState.loading());
          final result = await _deleteEvent.execute(eventId, deleteAllRepeated);
          result.fold(
            (l) => emit(CalendarState.error(l.message)),
            (r) => emit(CalendarState.loaded(r)),
          );
        },
      );
    });
  }
}
