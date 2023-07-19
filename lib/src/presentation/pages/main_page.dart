import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_pptik/src/presentation/pages/calendar_page.dart';
import 'package:lms_pptik/src/presentation/pages/dashboard_page.dart';
import 'package:lms_pptik/src/presentation/pages/profile_page.dart';

import '../blocs/main_index/main_index_cubit.dart';
import 'badge_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MainIndexCubit, int>(
        builder: (context, state) {
          return IndexedStack(
            index: state,
            children: const [
              DashboardPage(),
              CalendarPage(),
              BadgePage(),
              ProfilePage()
            ],
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<MainIndexCubit, int>(
        builder: (context, state) {
          return BottomNavigationBar(
            onTap: (value) {
              BlocProvider.of<MainIndexCubit>(context).changeIndex(value);
            },
            currentIndex: state,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: 'Dashboard'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month), label: 'Kalender'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.security), label: 'Lencana'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profil'),
            ],
          );
        },
      ),
    );
  }
}
