import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:lms_pptik/src/data/models/notification_model.dart';
import 'package:lms_pptik/src/extensions/int_extension.dart';
import 'package:lms_pptik/src/presentation/blocs/bloc/notification_bloc.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    Future.microtask(() {
      BlocProvider.of<GetNotificationsBloc>(context)
          .add(const NotificationEvent.getNotifications());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi'),
      ),
      body: BlocBuilder<GetNotificationsBloc, NotificationState>(
          builder: (context, state) {
        return state.maybeWhen(loaded: (notifications) {
          notifications as List<NotificationModel>;
          if (notifications.isEmpty) {
            return const Center(
              child: Text('Tidak ada notifikasi'),
            );
          }
          return ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            fullscreenDialog: true,
                            builder: (context) {
                              return Scaffold(
                                appBar: AppBar(
                                  title: Text(
                                    notifications[index].subject!,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                body: SingleChildScrollView(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        contentPadding: EdgeInsets.zero,
                                        title: Text(
                                          notifications[index].subject!,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: Text(
                                          notifications[index]
                                              .timecreated!
                                              .toDate(),
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                      ),
                                      Html(
                                        data: notifications[index]
                                            .fullmessagehtml,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }));
                  },
                  visualDensity:
                      const VisualDensity(horizontal: 0, vertical: -4),
                  leading:
                      notifications[index].eventtype == 'assign_notification'
                          ? const Icon(Icons.assignment_outlined)
                          : const Icon(Icons.notifications_outlined),
                  title: Text(
                    notifications[index].subject!,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    notifications[index].timecreated!.toDate(),
                    style: const TextStyle(fontSize: 12),
                  ),
                );
              });
        }, loading: () {
          return const Center(child: CircularProgressIndicator());
        }, orElse: () {
          return const Center(child: Text('Tidak ada notifikasi'));
        });
      }),
    );
  }
}
