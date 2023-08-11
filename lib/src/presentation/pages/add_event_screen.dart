import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lms_pptik/src/data/models/event_model.dart';
import 'package:lms_pptik/src/presentation/blocs/calendar/calendar_bloc.dart';

enum EventDuration { withoutDuration, untilWhen, inMinutes }

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  late final TextEditingController _titleCtrl;
  late final TextEditingController _descCtrl;
  late final TextEditingController _startDateCtrl;
  late final TextEditingController _endDateCtrl;
  late final TextEditingController _minutesCtrl;
  late final TextEditingController _repeatWeekCtrl;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  EventDuration _eventDuration = EventDuration.withoutDuration;
  bool _isRepeated = false;

  @override
  void initState() {
    _titleCtrl = TextEditingController();
    _descCtrl = TextEditingController();
    _startDateCtrl = TextEditingController(
        text: DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now()));
    _endDateCtrl = TextEditingController();
    _minutesCtrl = TextEditingController();
    _repeatWeekCtrl = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    _descCtrl.dispose();
    _startDateCtrl.dispose();
    _endDateCtrl.dispose();
    _minutesCtrl.dispose();
    _repeatWeekCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambahkan Acara'),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final name = _titleCtrl.text;

              final startDate = startDateHandler();

              final endDate = endDateHandler();
              final repeatWeek = _repeatWeekCtrl.text;
              final desc = _descCtrl.text;
              context.read<AddEventBloc>().add(CalendarEvent.addEvent(
                  EventModel(
                    name: name,
                    description: desc,
                    timeduration: endDate,
                    timestart: startDate,
                  ),
                  repeatWeek.isNotEmpty && repeatWeek != '0'
                      ? int.parse(repeatWeek)
                      : 1));
            }
          },
          icon: const Icon(Icons.save),
          label: const Text('Simpan')),
      body: BlocListener<AddEventBloc, CalendarState>(
        listener: (context, state) {
          state.whenOrNull(
            loading: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Menyimpan acara...'),
                ),
              );
            },
            loaded: (data) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Berhasil menyimpan acara'),
                ),
              );
              context
                  .read<GetEventBloc>()
                  .add(const CalendarEvent.getAllEvent());

              Navigator.pop(context);
            },
          );
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Judul acara tidak boleh kosong';
                    }
                    return null;
                  },
                  controller: _titleCtrl,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.edit_calendar_outlined),
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Masukkan judul acara',
                      labelText: 'Judul Acara'),
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _startDateCtrl,
                  onTap: () {
                    showDatePicker(
                      context: context,
                      firstDate: DateTime(2022),
                      initialDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    ).then((datetime) {
                      showTimePicker(
                              context: context, initialTime: TimeOfDay.now())
                          .then((clock) {
                        final date = DateTime(datetime!.year, datetime.month,
                            datetime.day, clock!.hour, clock.minute);
                        _startDateCtrl.text = DateFormat('yyyy-MM-dd HH:mm')
                            .format(date)
                            .toString();
                      });
                    });
                  },
                  readOnly: true,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.edit_calendar_outlined),
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Masukkan Tanggal',
                      labelText: 'Tanggal Mulai'),
                ),
                const SizedBox(height: 14),
                const Text(
                  'Durasi',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                ListTile(
                  title: const Text('Tanpa Durasi'),
                  trailing: Radio(
                      value: EventDuration.withoutDuration,
                      groupValue: _eventDuration,
                      onChanged: (value) {
                        setState(() {
                          _eventDuration = value!;
                        });
                      }),
                ),
                ListTile(
                  title: const Text('Sampai dengan'),
                  trailing: Radio(
                      value: EventDuration.untilWhen,
                      groupValue: _eventDuration,
                      onChanged: (value) {
                        setState(() {
                          _eventDuration = value!;
                        });
                      }),
                ),
                TextFormField(
                  controller: _endDateCtrl,
                  enabled: _eventDuration == EventDuration.untilWhen,
                  onTap: () {
                    showDatePicker(
                      context: context,
                      firstDate: DateTime(2022),
                      initialDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    ).then((datetime) {
                      showTimePicker(
                              context: context, initialTime: TimeOfDay.now())
                          .then((clock) {
                        final date = DateTime(datetime!.year, datetime.month,
                            datetime.day, clock!.hour, clock.minute);
                        _endDateCtrl.text = DateFormat('yyyy-MM-dd HH:mm')
                            .format(date)
                            .toString();
                      });
                    });
                  },
                  readOnly: true,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.edit_calendar_outlined),
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Masukkan Tanggal',
                      labelText: 'Tanggal Akhir'),
                ),
                ListTile(
                  title: const Text('Durasi dalam menit'),
                  trailing: Radio(
                      value: EventDuration.inMinutes,
                      groupValue: _eventDuration,
                      onChanged: (value) {
                        setState(() {
                          _eventDuration = value!;
                        });
                      }),
                ),
                TextFormField(
                  controller: _minutesCtrl,
                  enabled: _eventDuration == EventDuration.inMinutes,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.timer_outlined),
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Masukkan durasi',
                      labelText: 'Durasi dalam menit'),
                ),
                const SizedBox(height: 14),
                ListTile(
                  title: const Text(
                    'Ulangi',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  trailing: Switch(
                      value: _isRepeated,
                      onChanged: (value) {
                        setState(() {
                          _isRepeated = value;
                        });
                      }),
                ),
                TextFormField(
                  controller: _repeatWeekCtrl,
                  enabled: _isRepeated,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.timer_outlined),
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Masukkan jumlah kali',
                      labelText: 'Ulangi setiap berapa minggu'),
                ),
                const SizedBox(height: 14),
                SizedBox(
                  height: 200,
                  child: TextFormField(
                    controller: _descCtrl,
                    maxLines: null,
                    decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        hintText: 'Tambahkan deskripsi',
                        labelText: 'Deskripsi'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  int startDateHandler() {
    return (DateTime.parse(_startDateCtrl.text).millisecondsSinceEpoch) ~/ 1000;
  }

  int endDateHandler() {
    if (_eventDuration == EventDuration.withoutDuration) {
      return 0;
    } else if (_eventDuration == EventDuration.untilWhen) {
      final startDate = _startDateCtrl.text;
      final endDate = _endDateCtrl.text;
      final duration = DateTime.parse(endDate)
              .difference(DateTime.parse(startDate))
              .inSeconds ~/
          1000;
      return duration;
    } else {
      return Duration(minutes: int.parse(_minutesCtrl.text)).inSeconds;
    }
  }
}
