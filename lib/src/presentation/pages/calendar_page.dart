import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:lms_pptik/src/extensions/int_extension.dart';
import 'package:lms_pptik/src/presentation/blocs/calendar/calendar_bloc.dart';
import 'package:lms_pptik/src/presentation/pages/add_event_screen.dart';
import 'package:lms_pptik/src/presentation/pages/export_event_screen.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'dart:math' as math;
import '../../data/models/event_model.dart';
import '../components/remove_glow.dart';

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
                      return const AddEventScreen();
                    }));
          },
          label: const Text('Tambahkan Acara'),
          icon: const Icon(Icons.add_alert_outlined)),
      appBar: AppBar(
        title: const Text('Kalender'),
        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (context) {
                        return const ExportEventScreen();
                      }));
            },
            label: const Text('Export'),
            icon: const Icon(Icons.upload_file),
          ),
        ],
      ),
      body: BlocListener<DeleteEventBloc, CalendarState>(
        listener: (context, state) {
          state.whenOrNull(loaded: (data) {
            BlocProvider.of<GetEventBloc>(context)
                .add(const CalendarEvent.getAllEvent());
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Berhasil Menghapus Acara'),
            ));
            Navigator.pop(context);

            Navigator.pop(context);
          }, error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(message),
            ));
          });
        },
        child: BlocBuilder<GetEventBloc, CalendarState>(
          builder: (context, state) {
            return state.maybeWhen(
                loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                loaded: (data) {
                  data as List<EventModel>;
                  return RefreshIndicator(
                    onRefresh: () {
                      BlocProvider.of<GetEventBloc>(context)
                          .add(const CalendarEvent.getAllEvent());
                      return Future.delayed(const Duration(seconds: 1));
                    },
                    child: ScrollConfiguration(
                      behavior: RemoveGlow(),
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: SfCalendar(
                            viewNavigationMode: ViewNavigationMode.snap,
                            allowViewNavigation: true,
                            cellEndPadding: 5,
                            allowAppointmentResize: true,
                            allowedViews: const [
                              CalendarView.day,
                              CalendarView.week,
                              CalendarView.workWeek,
                              CalendarView.timelineDay,
                              CalendarView.timelineWeek,
                              CalendarView.timelineWorkWeek,
                              CalendarView.month,
                              CalendarView.schedule
                            ],
                            headerHeight: 60,
                            showTodayButton: true,
                            showNavigationArrow: true,
                            onTap: (details) {
                              List<dynamic> appointments =
                                  details.appointments as List<dynamic>;
                              DateTime date = details.date!;
                              String element = details.targetElement.name;
                              if (appointments.isNotEmpty) {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    showDragHandle: true,
                                    context: context,
                                    builder: (context) {
                                      EventModel event = appointments[0];

                                      if (element == 'calendarCell') {
                                        return buildCalenderCellEvents(
                                            appointments);
                                      }
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Text(
                                              'Acara Hari Ini',
                                              style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const Divider(),
                                            ListTile(
                                              trailing: IconButton(
                                                  onPressed: () {
                                                    showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            content: const Text(
                                                                'Hapus semua acara beserta turunannya?'),
                                                            actions: [
                                                              TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child: const Text(
                                                                      'Batal')),
                                                              TextButton(
                                                                onPressed: () {
                                                                  context
                                                                      .read<
                                                                          DeleteEventBloc>()
                                                                      .add(CalendarEvent.deleteEvent(
                                                                          event
                                                                              .id!,
                                                                          false));
                                                                },
                                                                child: const Text(
                                                                    'Hapus acara ini saja'),
                                                              ),
                                                              TextButton(
                                                                onPressed: () {
                                                                  context
                                                                      .read<
                                                                          DeleteEventBloc>()
                                                                      .add(CalendarEvent.deleteEvent(
                                                                          event
                                                                              .id!,
                                                                          true));
                                                                },
                                                                child: const Text(
                                                                    'Hapus semua acara ini'),
                                                              )
                                                            ],
                                                          );
                                                        });
                                                  },
                                                  icon: const Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                  )),
                                              leading: Icon(
                                                Icons.event,
                                                color: event.background,
                                              ),
                                              title: Text(event.name!),
                                              subtitle:
                                                  Text(event.description!),
                                            ),
                                            Html(data: event.description!)
                                          ],
                                        ),
                                      );
                                    });
                              }
                            },
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
                                  MonthAppointmentDisplayMode.indicator,
                            ),
                            scheduleViewMonthHeaderBuilder:
                                scheduleHeaderViewBuilder,
                            scheduleViewSettings: const ScheduleViewSettings(),
                          ),
                        ),
                      ),
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
      ),
    );
  }

  Padding buildCalenderCellEvents(List<dynamic> appointments) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Daftar Acara',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          ListView.builder(
              shrinkWrap: true,
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                final appointment = appointments[index] as EventModel;
                return ExpansionTile(
                    trailing: IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: const Text(
                                      'Hapus semua acara beserta turunannya?'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Batal')),
                                    TextButton(
                                      onPressed: () {
                                        context.read<DeleteEventBloc>().add(
                                            CalendarEvent.deleteEvent(
                                                appointment.id!, false));
                                      },
                                      child: const Text('Hapus acara ini saja'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        context.read<DeleteEventBloc>().add(
                                            CalendarEvent.deleteEvent(
                                                appointment.id!, true));
                                      },
                                      child:
                                          const Text('Hapus semua acara ini'),
                                    )
                                  ],
                                );
                              });
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                    subtitle: Text(
                        '${DateFormat('yyyy-MM-dd HH:mm').format(appointment.timestart!.toDateTime())} - ${DateFormat('yyyy-MM-dd HH:mm').format(appointment.timestart!.toDateTime().add(Duration(seconds: appointment.timeduration!)))}'),
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    leading: const Icon(Icons.event),
                    title: Text(appointment.name!),
                    children: [
                      const SizedBox(height: 10),
                      Html(data: appointment.description!)
                    ]);
              })
        ],
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
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
        .withOpacity(1.0);
  }

  @override
  String getSubject(int index) {
    return appointments![index].name;
  }

  @override
  Object? convertAppointmentToObject(
      Object? customData, Appointment appointment) {
    return _Event(appointment.subject, appointment.startTime,
        appointment.endTime, appointment.color);
  }
}

class _Event {
  String eventName;
  DateTime startData;
  DateTime endDate;
  Color background;

  _Event(this.eventName, this.startData, this.endDate, this.background);
}
