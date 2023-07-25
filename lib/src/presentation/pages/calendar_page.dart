import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_pptik/src/extensions/int_extension.dart';
import 'package:lms_pptik/src/presentation/blocs/calendar/calendar_bloc.dart';
import 'package:lms_pptik/src/presentation/pages/add_event_screen.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../data/models/event_model.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late CalendarController _calendarController;

  @override
  void initState() {
    _calendarController = CalendarController();
    Future.microtask(() => BlocProvider.of<GetEventBloc>(context)
        .add(const CalendarEvent.getAllEvent()));
    super.initState();
  }

  String _getMonthName(int month) {
    switch (month) {
      case 01:
        return 'January';
      case 02:
        return 'February';
      case 03:
        return 'March';
      case 04:
        return 'April';
      case 05:
        return 'May';
      case 06:
        return 'June';
      case 07:
        return 'July';
      case 08:
        return 'August';
      case 09:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      default:
        return 'December';
    }
  }

  Widget scheduleHeaderViewBuilder(
      BuildContext context, ScheduleViewMonthHeaderDetails details) {
    final String monthName = _getMonthName(details.date.month);
    return Stack(
      children: [
        Image(
            image: ExactAssetImage('assets/img/$monthName.png'),
            fit: BoxFit.cover,
            width: details.bounds.width,
            height: details.bounds.height),
        Positioned(
          left: 55,
          right: 0,
          top: 20,
          bottom: 0,
          child: Text(
            '$monthName ${details.date.year}',
            style: const TextStyle(fontSize: 18),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (context) {
                      return AddEventScreen();
                    }));
          },
          label: const Text('Tambahkan Acara'),
          icon: const Icon(Icons.add_alert_outlined)),
      appBar: AppBar(
        title: const Text('Kalender'),
      ),
      body: BlocBuilder<GetEventBloc, CalendarState>(
        builder: (context, state) {
          return state.maybeWhen(
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
              loaded: (data) {
                data as List<EventModel>;
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: SfCalendar(
                    cellEndPadding: 5,
                    allowAppointmentResize: true,
                    allowedViews: const [
                      CalendarView.schedule,
                      CalendarView.month,
                    ],
                    headerHeight: 60,
                    onTap: (detail) {},
                    headerStyle: const CalendarHeaderStyle(
                      textStyle: TextStyle(fontSize: 18),
                    ),
                    controller: _calendarController,
                    dataSource: EventsDataSource(data),
                    view: CalendarView.month,
                    initialDisplayDate: DateTime.now(),
                    showDatePickerButton: true,
                    showCurrentTimeIndicator: true,
                    todayHighlightColor: Theme.of(context).primaryColor,
                    monthViewSettings: const MonthViewSettings(
                      agendaStyle: AgendaStyle(
                        appointmentTextStyle: TextStyle(
                          color: Colors.white,
                        ),
                        dateTextStyle: TextStyle(fontSize: 12),
                      ),
                      agendaItemHeight: 40,
                      showAgenda: true,
                      appointmentDisplayMode:
                          MonthAppointmentDisplayMode.appointment,
                    ),
                    scheduleViewMonthHeaderBuilder: scheduleHeaderViewBuilder,
                    scheduleViewSettings: const ScheduleViewSettings(),
                  ),
                );
              },
              orElse: () {
                return const Center(
                  child: Text('Gagal memuat kalender'),
                );
              });
        },
      ),
    );
  }
}

class EventsDataSource extends CalendarDataSource {
  EventsDataSource(List<EventModel> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    int time = appointments![index].timestart;
    return time.toDateTime();
  }

  @override
  getEndTime(int index) {
    if (appointments![index].timeduration != 0) {
      int time = appointments![index].timestart;
      Duration duration =
          Duration(milliseconds: appointments![index].timeduration * 1000);
      return time.toDateTime().add(duration);
    } else {
      int time = appointments![index].timestart;
      return time.toDateTime().add(const Duration(hours: 1));
    }
  }

  @override
  Color getColor(int index) {
    return Colors.blue.shade900;
  }

  @override
  String getSubject(int index) {
    return appointments![index].name;
  }
}
