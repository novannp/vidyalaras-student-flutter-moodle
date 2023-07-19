import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cubit/dark_mode_cubit.dart';

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
        ],
      )),
    );
  }
}
