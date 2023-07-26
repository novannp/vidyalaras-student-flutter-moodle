import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_pptik/src/extensions/string_extension.dart';
import 'package:lms_pptik/src/presentation/blocs/notification/notification_bloc.dart';
import 'package:lms_pptik/src/utils/constant.dart';

import '../../data/models/course_model.dart';
import '../blocs/chat/chat_bloc.dart';
import '../blocs/course/course_bloc.dart';
import '../blocs/dropdown_course/dropdown_course_cubit.dart';
import '../blocs/user/user_bloc.dart';
import '../components/course_card.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _MainPageState();
}

class _MainPageState extends State<DashboardPage> {
  late final Timer _timer;

  int _previousMessageCount = 0;
  int _previousNotificationCount = 0;

  final List _items = [
    {
      'text': 'Semua Kelas',
      'value': 'all',
    },
    {
      'text': 'Kelas Favorit',
      'value': 'favourites',
    },
    {
      'text': 'Kelas Lalu',
      'value': 'past',
    },
    {
      'text': 'Kelas Aktif',
      'value': 'inprogress',
    },
    {
      'text': 'Disembunyikan',
      'value': 'hidden',
    },
  ];

  @override
  void initState() {
    Future.microtask(() {
      BlocProvider.of<GetCurrentUserBloc>(context)
          .add(const UserEvent.getCurrenctUser());
      BlocProvider.of<GetRecentCourseBloc>(context)
          .add(const CourseEvent.getRecentCourse());
      BlocProvider.of<GetFilteredCourseBloc>(context)
          .add(const CourseEvent.getFilteredCourse("all"));
    });

    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      BlocProvider.of<GetUnreadMessageCountBloc>(context)
          .add(const ChatEvent.getUnreadMessageCount());
      BlocProvider.of<GetNotificationCountBloc>(context)
          .add(const NotificationEvent.getNotificationCount());
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).pushNamed('chat');
            },
            icon: BlocBuilder<GetUnreadMessageCountBloc, ChatState>(
              builder: (context, state) {
                return Badge(
                    isLabelVisible: state.maybeWhen(
                      loaded: (data) {
                        data as int;
                        _previousMessageCount = data;
                        return data > 0;
                      },
                      orElse: () {
                        return _previousMessageCount != 0;
                      },
                    ),
                    label: Text(
                      state.maybeWhen(
                        loaded: (data) {
                          data as int;
                          return data.toString();
                        },
                        orElse: () {
                          return _previousMessageCount.toString();
                        },
                      ),
                    ),
                    child: const Icon(
                      Icons.message_rounded,
                      size: 20,
                    ));
              },
            ),
          ),
          IconButton(
            onPressed: () {
              GoRouter.of(context).pushNamed('notification');
            },
            icon: BlocBuilder<GetNotificationCountBloc, NotificationState>(
              builder: (context, state) {
                return Badge(
                    isLabelVisible: state.maybeWhen(
                      loaded: (data) {
                        data as int;
                        _previousNotificationCount = data;
                        return data > 0;
                      },
                      orElse: () {
                        return _previousNotificationCount != 0;
                      },
                    ),
                    label: Text(
                      state.maybeWhen(
                        loaded: (data) {
                          data as int;
                          return data.toString();
                        },
                        orElse: () {
                          return _previousNotificationCount.toString();
                        },
                      ),
                    ),
                    child: Icon(
                      Icons.notifications,
                      size: 20,
                    ));
              },
            ),
          ),
        ],
        leadingWidth: 60,
        title: BlocBuilder<GetCurrentUserBloc, UserState>(
          builder: (context, state) {
            return state.maybeWhen(
              initial: () {
                return const Text('User');
              },
              loading: () => const Text('Loading...'),
              loaded: (user) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Selamat Datang !',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      user.name!,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                );
              },
              orElse: () {
                return const Text('User');
              },
            );
          },
        ),
        leading: BlocBuilder<GetCurrentUserBloc, UserState>(
          builder: (context, state) {
            return state.maybeWhen(
              initial: () {
                BlocProvider.of<GetCurrentUserBloc>(context)
                    .add(const UserEvent.getCurrenctUser());
                return const CircleAvatar();
              },
              loading: () => const Padding(
                padding: EdgeInsets.only(left: 20),
                child: CircleAvatar(),
              ),
              loaded: (user) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatar!),
                  ),
                );
              },
              orElse: () {
                return const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: CircleAvatar(),
                );
              },
            );
          },
        ),
      ),
      body: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        displacement: 100,
        onRefresh: () async {
          return await Future.delayed(const Duration(seconds: 2), () {
            BlocProvider.of<GetCurrentUserBloc>(context)
                .add(const UserEvent.getCurrenctUser());
            BlocProvider.of<GetRecentCourseBloc>(context)
                .add(const CourseEvent.getRecentCourse());
            BlocProvider.of<GetFilteredCourseBloc>(context)
                .add(const CourseEvent.getFilteredCourse("all"));
          });
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              TextField(
                readOnly: true,
                onTap: () {
                  GoRouter.of(context).pushNamed('search');
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Cari Kelas',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Baru Saja Diakses',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              BlocBuilder<GetRecentCourseBloc, CourseState>(
                builder: (context, state) {
                  return state.maybeWhen(loaded: (data) {
                    data as List<CourseModel>;
                    return SizedBox(
                      height: 120,
                      width: size.width - 42,
                      child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () {
                                GoRouter.of(context).pushNamed('course_detail',
                                    extra: data[index]);
                              },
                              child: Card(
                                child: Container(
                                  height: 120,
                                  width: size.width - 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 30,
                                        height: double.infinity,
                                        color: flatColor[index % 5],
                                        child: const Icon(Icons.book,
                                            color: Colors.white),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data[index]
                                                  .fullname!
                                                  .decodeHtml(),
                                              style: const TextStyle(
                                                fontSize: 16,
                                                // color: Colors.white,
                                              ),
                                            ),
                                            Text(data[index].coursecategory!),
                                            const Spacer(),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  height: 20,
                                                  width: 20,
                                                  child:
                                                      CircularProgressIndicator(
                                                    value: (data[index]
                                                            .progress!
                                                            .toDouble() /
                                                        100),
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                    '${data[index].progress}% Selesai')
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    );
                  }, orElse: () {
                    return const Center(child: Text('Kelas tidak ada'));
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Kelas Saya',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  BlocBuilder<DropdownCourseCubit, String>(
                    builder: (context, state) {
                      return DropdownButtonHideUnderline(
                        child: DropdownButton(
                          borderRadius: BorderRadius.circular(10),
                          hint: const Text('Semua Kelas'),
                          value: state,
                          style: Theme.of(context).textTheme.bodySmall,
                          items: _items.map((e) {
                            return DropdownMenuItem(
                              value: e['value'],
                              child: Text(e['text']),
                            );
                          }).toList(),
                          onChanged: (value) {
                            BlocProvider.of<GetFilteredCourseBloc>(context).add(
                              CourseEvent.getFilteredCourse(
                                value.toString(),
                              ),
                            );
                            BlocProvider.of<DropdownCourseCubit>(context)
                                .changeCategory(value.toString());
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              BlocBuilder<GetFilteredCourseBloc, CourseState>(
                  builder: (context, state) {
                return state.maybeWhen(loaded: (data) {
                  data as List<CourseModel>;
                  if (data.isEmpty) {
                    return const Center(child: Text('Kelas tidak ada'));
                  }
                  return Column(
                    children: data.map(
                      (course) {
                        return CourseCard(
                          course: course,
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                              'course_detail',
                              extra: course,
                            );
                          },
                          showMenu: true,
                        );
                      },
                    ).toList(),
                  );
                }, loading: () {
                  return const Center(
                    child: Text('Memuat kelas...'),
                  );
                }, orElse: () {
                  return const Center(child: Text('Kelas tidak ada'));
                });
              })
            ],
          ),
        ),
      ),
    );
  }
}
