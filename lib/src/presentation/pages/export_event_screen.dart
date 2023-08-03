import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_pptik/src/presentation/blocs/calendar/calendar_bloc.dart';
import 'package:lms_pptik/src/utils/helper/function_helper/function_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class ExportEventScreen extends StatefulWidget {
  const ExportEventScreen({super.key});

  @override
  State<ExportEventScreen> createState() => _ExportEventScreenState();
}

class _ExportEventScreenState extends State<ExportEventScreen> {
  List<Map<String, dynamic>> times = [
    {'Minggu sekarang': 'weeknow'},
    {'Minggu depan': 'weeknext'},
    {'Bulan sekarang': 'monthnow'},
    {'Bulang depan': 'monthnext'},
    {'Yang akan datang baru ini': 'recentupcoming'},
  ];

  String _selectedTime = 'weeknow';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BlocListener<ExportEventsBloc, CalendarState>(
        listener: (context, state) {
          state.whenOrNull(
            loaded: (data) {
              data as String;
              FunctionHelper.downloadEventHandler(
                  context, '$data/Export events.ics');
            },
          );
        },
        child: FloatingActionButton.extended(
          onPressed: () {
            context
                .read<ExportEventsBloc>()
                .add(CalendarEvent.exportEvents(_selectedTime));
          },
          icon: const Icon(Icons.upload),
          label: const Text('Export'),
        ),
      ),
      appBar: AppBar(
        title: const Text('Export Kalender'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Acara yang akan di export',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            for (var time in times)
              RadioListTile(
                title: Text(time.keys.first),
                value: time.values.first,
                groupValue: _selectedTime,
                onChanged: (value) {
                  setState(() {
                    _selectedTime = value.toString();
                  });
                },
              ),
          ],
        ),
      ),
    );
  }
}
