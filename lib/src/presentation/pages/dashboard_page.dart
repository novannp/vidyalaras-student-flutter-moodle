import 'dart:async';
import 'dart:developer';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:lms_pptik/src/extensions/string_extension.dart';
import 'package:lms_pptik/src/presentation/blocs/notification/notification_bloc.dart';
import 'package:lms_pptik/src/presentation/blocs/quote/quote_bloc.dart';
import 'package:lms_pptik/src/utils/constant.dart';

import '../../data/models/course_model.dart';
import '../../data/models/quote_model.dart';
import '../../data/models/user_model/user_model.dart';
import '../blocs/chat/chat_bloc.dart';
import '../blocs/course/course_bloc.dart';
import '../blocs/dropdown_course/dropdown_course_cubit.dart';
import '../blocs/user/user_bloc.dart';
import '../components/course_card.dart';
import '../components/remove_glow.dart';
import 'package:lms_pptik/injection.dart' as di;

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPage();
}

class IsolateModel {
  BuildContext context;
  SendPort sendPort;
  IsolateModel(this.context, this.sendPort);
}

class _DashboardPage extends State<DashboardPage> {
  int _previousMessageCount = 0;
  int _previousNotificationCount = 0;
  Timer? timer;
  Timer? quoteTimer;
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
      BlocProvider.of<GetNotificationCountBloc>(context)
          .add(const NotificationEvent.getNotificationCount());
      BlocProvider.of<GetConversationsBloc>(context)
          .add(const ChatEvent.getConversations());
      BlocProvider.of<GetUnreadMessageCountBloc>(context)
          .add(const ChatEvent.getUnreadMessageCount());
      BlocProvider.of<GetCurrentUserBloc>(context)
          .add(const UserEvent.getCurrenctUser());
      BlocProvider.of<GetQuoteBloc>(context)
          .add(const QuoteEvent.getQuote('Education'));
      BlocProvider.of<GetRecentCourseBloc>(context)
          .add(const CourseEvent.getRecentCourse());

      BlocProvider.of<GetFilteredCourseBloc>(context)
          .add(const CourseEvent.getFilteredCourse("all"));
    });
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      BlocProvider.of<GetNotificationCountBloc>(context)
          .add(const NotificationEvent.getNotificationCount());

      BlocProvider.of<GetUnreadMessageCountBloc>(context)
          .add(const ChatEvent.getUnreadMessageCount());
    });

    quoteTimer = Timer.periodic(const Duration(minutes: 15), (timer) {
      BlocProvider.of<GetQuoteBloc>(context)
          .add(const QuoteEvent.getQuote('Education'));
    });
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
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
                    child: const Icon(
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
                user as UserModel;
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
                      user.fullname!,
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
                user as UserModel;
                return Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(user.profileimageurl!),
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
            BlocProvider.of<GetNotificationCountBloc>(context)
                .add(const NotificationEvent.getNotificationCount());
            BlocProvider.of<GetConversationsBloc>(context)
                .add(const ChatEvent.getConversations());
            BlocProvider.of<GetUnreadMessageCountBloc>(context)
                .add(const ChatEvent.getUnreadMessageCount());
            BlocProvider.of<GetQuoteBloc>(context)
                .add(const QuoteEvent.getQuote('Education'));
          });
        },
        child: ScrollConfiguration(
          behavior: RemoveGlow(),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Hero(
                  tag: 'jumbotron',
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                    child: Container(
                      height: size.height * 0.18,
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: NetworkImage('https://picsum.photos/600/200'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: BlocBuilder<GetQuoteBloc, QuoteState>(
                          builder: (context, state) {
                            return Container(
                              width: size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black.withOpacity(0.3),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      state.whenOrNull(
                                            loaded: (data) {
                                              data as QuoteModel;
                                              return data.content;
                                            },
                                          ) ??
                                          '"Be yourself; everyone else is already taken."',
                                      style: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      state.whenOrNull(
                                            loaded: (data) {
                                              data as QuoteModel;
                                              return data.author;
                                            },
                                          ) ??
                                          'Oscar Wilde',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
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
                                  GoRouter.of(context).pushNamed(
                                      'course_detail',
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
                              BlocProvider.of<GetFilteredCourseBloc>(context)
                                  .add(
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
      ),
    );
  }
}
