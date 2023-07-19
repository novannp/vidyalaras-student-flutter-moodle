import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/usecase/calendar/get_all_event.dart';

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
