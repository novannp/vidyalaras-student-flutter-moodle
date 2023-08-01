import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_pptik/src/presentation/blocs/quote/quote_bloc.dart';
import 'package:lms_pptik/src/presentation/blocs/quote_setting/quote_setting_cubit.dart';

import '../../data/models/tag_model.dart';
import '../blocs/dark_mode/dark_mode_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          ListTile(
            trailing: BlocBuilder<DarkModeCubit, bool>(
              builder: (context, state) {
                return Switch(
                  value: state,
                  onChanged: (value) {
                    context.read<DarkModeCubit>().changeMode(value);
                  },
                );
              },
            ),
            title: const Text('Mode Gelap'),
            leading: const Icon(Icons.dark_mode_rounded),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const QuotesSettingsPage();
              }));
            },
            leading: const Icon(Icons.format_quote_sharp),
            title: const Text('Notifikasi Quotes'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
          )
        ],
      )),
    );
  }
}

class QuotesSettingsPage extends StatefulWidget {
  const QuotesSettingsPage({super.key});

  @override
  State<QuotesSettingsPage> createState() => _QuotesSettingsPageState();
}

class _QuotesSettingsPageState extends State<QuotesSettingsPage> {
  @override
  void initState() {
    Future.microtask(() {
      context.read<GetTagsBloc>().add(const QuoteEvent.getTags());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi Quotes'),
      ),
      body: BlocBuilder<QuoteSettingCubit, Map<String, dynamic>>(
        builder: (context, quote) {
          bool isEnabled = quote['isEnabled'] as bool;
          int frequency = quote['frequency'] as int;
          String tag = quote['tag'] as String;
          return Column(
            children: [
              ListTile(
                leading: const Icon(Icons.notifications_active_rounded),
                title: const Text('Tampilkan Notifikasi'),
                trailing: Switch(
                  value: isEnabled,
                  onChanged: (value) {
                    context.read<QuoteSettingCubit>().setEnabled(value);
                    setState(() {});
                  },
                ),
              ),
              Visibility(
                visible: isEnabled,
                child: ListTile(
                  leading: const Icon(Icons.av_timer),
                  title: const Text('Frekuensi Notifikasi'),
                  trailing: DropdownButton(
                      hint: const Text('Pilih Frekuensi'),
                      value: frequency,
                      items: const [
                        DropdownMenuItem(
                          value: 1,
                          child: Text('1 jam sekali'),
                        ),
                        DropdownMenuItem(
                          value: 3,
                          child: Text('3 jam sekali'),
                        ),
                        DropdownMenuItem(value: 6, child: Text('6 jam sekali')),
                        DropdownMenuItem(
                            value: 12, child: Text('12 jam sekali')),
                        DropdownMenuItem(
                            value: 24, child: Text('24 jam sekali')),
                      ],
                      onChanged: (value) {
                        context
                            .read<QuoteSettingCubit>()
                            .setFrequency(value as int);
                        setState(() {});
                      }),
                ),
              ),
              Visibility(
                visible: isEnabled,
                child: ListTile(
                  title: const Text('Jenis Quote'),
                  leading: const Icon(Icons.format_quote_sharp),
                  trailing: BlocBuilder<GetTagsBloc, List<TagModel>>(
                    builder: (context, state) {
                      return DropdownButton<String>(
                          hint: const Text('Pilih Jenis Quote'),
                          items: state.map((e) {
                            return DropdownMenuItem(
                              value: e.name,
                              child: Text(e.name!),
                            );
                          }).toList(),
                          value: tag,
                          onChanged: (value) {
                            context.read<QuoteSettingCubit>().setTag(value!);
                            setState(() {});
                          });
                    },
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
