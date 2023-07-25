import 'package:flutter/material.dart';

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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  EventDuration _eventDuration = EventDuration.withoutDuration;
  bool _isRepeated = false;

  @override
  void initState() {
    _titleCtrl = TextEditingController();
    _descCtrl = TextEditingController();
    _startDateCtrl = TextEditingController();
    _endDateCtrl = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    _descCtrl.dispose();
    _startDateCtrl.dispose();
    _endDateCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambahkan Acara'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.edit_calendar_outlined),
                    contentPadding: EdgeInsets.zero,
                    hintText: 'Masukkan judul acara',
                    labelText: 'Judul Acara'),
              ),
              const SizedBox(height: 14),
              TextFormField(
                onTap: () {
                  showDatePicker(
                    context: context,
                    firstDate: DateTime(2022),
                    initialDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  ).then((value) {
                    showTimePicker(
                        context: context, initialTime: TimeOfDay.now());
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
                enabled: _eventDuration == EventDuration.untilWhen,
                onTap: () {
                  showDatePicker(
                    context: context,
                    firstDate: DateTime(2022),
                    initialDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  ).then((value) {
                    showTimePicker(
                        context: context, initialTime: TimeOfDay.now());
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
                  maxLines: null,
                  decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      hintText: 'Tambahkan deskripsi',
                      labelText: 'Deskripsi'),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: FilledButton(
                  child: const Text('Simpan'),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
