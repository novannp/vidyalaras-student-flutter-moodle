import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_pptik/src/data/models/user_model.dart';
import 'package:lms_pptik/src/extensions/int_extension.dart';
import 'package:lms_pptik/src/extensions/string_extension.dart';

import '../../data/models/course_model.dart';
import '../../data/models/materi_model/materi_model.dart';
import '../../data/models/user_grade_model/user_grade_model.dart';
import '../blocs/course/course_bloc.dart';
import '../blocs/mods/mod_assign/mod_assign_bloc.dart';
import '../blocs/mods/mod_state.dart';

class CourseDetailPage extends StatefulWidget {
  const CourseDetailPage({super.key, required this.course});

  final CourseModel course;

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  initState() {
    _tabController = TabController(length: 4, vsync: this);
    Future.microtask(() {
      context
          .read<GetMateriBloc>()
          .add(CourseEvent.getMateri(widget.course.id!));
      context
          .read<GetEnrolledUserBloc>()
          .add(CourseEvent.getEnrolledUser(widget.course.id!));
      context
          .read<GetUserGradeBloc>()
          .add(CourseEvent.getUserGrade(widget.course.id!));
      context
          .read<GetAssignmentListBloc>()
          .add(ModAssignEvent.getAssignmentList(widget.course.id!));
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: buildMenuButton(context),
      appBar: buildAppBar(context),
      body: BlocListener<SubmitSubmissionBloc, ModState>(
        listener: (context, state) {
          state.whenOrNull(
            loaded: (data) {
              context
                  .read<GetMateriBloc>()
                  .add(CourseEvent.getMateri(widget.course.id!));
              context
                  .read<GetAssignmentListBloc>()
                  .add(ModAssignEvent.getAssignmentList(widget.course.id!));
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                    child: const Icon(Icons.school),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.course.fullname!.decodeHtml(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 8,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: LinearProgressIndicator(
                                value: widget.course.progress! / 100,
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer
                                    .withOpacity(0.5),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '${widget.course.progress!.toStringAsFixed(0)}%',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                child: TabBar(
                  labelPadding: const EdgeInsets.symmetric(vertical: 6),
                  isScrollable: false,
                  labelStyle: Theme.of(context).textTheme.bodySmall,
                  labelColor: Theme.of(context).colorScheme.primary,
                  unselectedLabelColor: Theme.of(context).colorScheme.secondary,
                  indicatorPadding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  controller: _tabController,
                  tabs: const [
                    Text('Materi'),
                    Text('Peserta'),
                    Text('Kompetensi'),
                    Text('Nilai')
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    buildMateriList(),
                    buildEnrolledUser(),
                    const Text('Kompetensi'),
                    buildGradeList()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        widget.course.fullname!.decodeHtml(),
      ),
      actions: [
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              showDragHandle: true,
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                            child: const Icon(Icons.school, size: 40),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.course.fullname!.decodeHtml(),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Chip(
                                label: Text(widget.course.coursecategory!),
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                labelStyle: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Row(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: 8,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: LinearProgressIndicator(
                                        value: widget.course.progress! / 100,
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .primaryContainer
                                            .withOpacity(0.5),
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Theme.of(context).colorScheme.primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    '${widget.course.progress!.toStringAsFixed(0)}%',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Tanggal Mulai Kursus',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.course.startdate!.toDate(),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Pengajar',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      BlocBuilder<GetEnrolledUserBloc, CourseState>(
                        builder: (context, state) {
                          return state.maybeWhen(loaded: (data) {
                            data as List<UserModel>;
                            final teachers = data.where((element) {
                              return element.roles!.any(
                                  (role) => role.shortname == 'editingteacher');
                            }).toList();
                            return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: teachers.length,
                                itemBuilder: (context, index) {
                                  final teacher = teachers[index];
                                  return ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(teacher.avatar!),
                                    ),
                                    title: Text(
                                      teacher.name!.decodeHtml(),
                                    ),
                                    subtitle: Text(teacher.email!),
                                    trailing: IconButton.filledTonal(
                                      onPressed: () {
                                        GoRouter.of(context).pushNamed(
                                          'chat_detail',
                                          extra: {
                                            'memberId': teacher.id,
                                          },
                                        );
                                      },
                                      icon: const Icon(Icons.message_rounded),
                                    ),
                                  );
                                });
                          }, orElse: () {
                            return const SizedBox();
                          });
                        },
                      )
                    ],
                  ),
                );
              },
            );
          },
          icon: const Icon(Icons.info_outline),
        )
      ],
    );
  }

  FloatingActionButton buildMenuButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            showDragHandle: true,
            context: context,
            builder: (context) {
              return Wrap(
                children: [
                  ListTile(
                    onTap: () {
                      GoRouter.of(context)
                          .pushNamed('assignment', extra: widget.course.id);
                    },
                    leading: const Icon(Icons.book, color: Colors.pink),
                    title: const Text('Assignment'),
                  ),
                  ListTile(
                    onTap: () {
                      GoRouter.of(context)
                          .pushNamed('resource', extra: widget.course);
                    },
                    leading: const Icon(
                      Icons.file_copy_rounded,
                      color: Colors.lightGreen,
                    ),
                    title: const Text('File'),
                  ),
                  const ListTile(
                    leading: Icon(
                      Icons.people,
                      color: Colors.amber,
                    ),
                    title: Text('Forum'),
                  ),
                  const ListTile(
                    leading: Icon(
                      Icons.menu_book_rounded,
                      color: Colors.deepOrangeAccent,
                    ),
                    title: Text('Pembelajaran'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.quiz_outlined,
                        color: Colors.deepPurpleAccent),
                    title: Text('Kuis'),
                  ),
                  const ListTile(
                    leading: Icon(
                      Icons.school,
                      color: Colors.lightBlue,
                    ),
                    title: Text('Workshop'),
                  ),
                ],
              );
            });
      },
      child: const Icon(Icons.list),
    );
  }

  BlocBuilder<GetUserGradeBloc, CourseState> buildGradeList() {
    return BlocBuilder<GetUserGradeBloc, CourseState>(
      builder: (context, state) {
        return state.maybeWhen(error: (error) {
          return Center(
            child: Text(error),
          );
        }, loading: () {
          return const Center(child: CircularProgressIndicator());
        }, loaded: (userGradeList) {
          userGradeList as List<UserGradeModel>;
          return ListView.builder(
              itemCount: userGradeList[0].gradeitems!.length,
              itemBuilder: (context, index) {
                final userGrade = userGradeList[0].gradeitems![index];
                return ExpansionTile(
                  leading: userGrade.itemmodule == 'workshop'
                      ? Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                          ),
                          child: const Icon(Icons.refresh))
                      : userGrade.itemmodule == 'assign'
                          ? Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.pinkAccent,
                              ),
                              child: const Icon(
                                Icons.book,
                                color: Colors.white,
                              ),
                            )
                          : userGrade.itemmodule == 'lesson'
                              ? Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                  ),
                                  child: const Icon(Icons.book_rounded))
                              : Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Theme.of(context)
                                        .colorScheme
                                        .errorContainer,
                                  ),
                                  child: const Icon(Icons.quiz_outlined)),
                  title: Text(userGrade.itemname ?? 'Tanpa nama'),
                  children: [
                    ListTile(
                      title: const Text('Nilai'),
                      trailing: Text('${userGrade.graderaw ?? '-'}'),
                    ),
                    ListTile(
                      title: const Text('Rentang'),
                      trailing: Text(
                          '${userGrade.grademin ?? '0'} - ${userGrade.grademax ?? '0'}'),
                    ),
                    ListTile(
                      title: const Text('Persentase'),
                      trailing: Text(userGrade.percentageformatted ?? '-'),
                    ),
                    const Text(
                      "Feedback",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Html(data: userGrade.feedback ?? '-'),
                  ],
                );
              });
        }, orElse: () {
          return const SizedBox();
        });
      },
    );
  }

  BlocBuilder<GetMateriBloc, CourseState> buildMateriList() {
    return BlocBuilder<GetMateriBloc, CourseState>(builder: (context, state) {
      return state.maybeWhen(orElse: () {
        return const SizedBox();
      }, initial: () {
        return const SizedBox();
      }, loading: () {
        return const Center(child: CircularProgressIndicator());
      }, loaded: (materi) {
        materi as List<MateriModel>;
        if (materi.isEmpty) {
          return const Center(
            child: Text('Tidak ada materi'),
          );
        }
        return ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: materi.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  GoRouter.of(context).pushNamed('materi_detail', extra: {
                    'materi': materi,
                    'selectedIndex': index,
                    'courseId': widget.course.id
                  });
                },
                leading: Icon(
                  Icons.book,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(materi[index].name!.decodeHtml()),
              );
            });
      }, error: (error) {
        return Center(
          child: Text(error),
        );
      });
    });
  }

  BlocBuilder<GetEnrolledUserBloc, CourseState> buildEnrolledUser() {
    return BlocBuilder<GetEnrolledUserBloc, CourseState>(
        builder: (context, state) {
      return state.maybeWhen(orElse: () {
        return const SizedBox();
      }, initial: () {
        return const SizedBox();
      }, loading: () {
        return const Center(child: CircularProgressIndicator());
      }, loaded: (user) {
        user as List<UserModel>;
        if (user.isEmpty) {
          return const Center(child: Text('Tidak ada peserta'));
        }
        return ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: user.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                showDialog(
                    barrierDismissible: false,
                    barrierColor: Colors.black.withOpacity(0.3),
                    context: context,
                    builder: (context) {
                      return BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: AlertDialog(
                          actionsAlignment: MainAxisAlignment.spaceBetween,
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    NetworkImage(user[index].avatar!),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                user[index].name ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Text(
                                user[index].email ?? '',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Text(
                                user[index].roles![0].shortname == 'student'
                                    ? 'Student'
                                    : 'Teacher',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              for (Group group in user[index].groups!)
                                Text(
                                  group.name ?? '-',
                                  style: Theme.of(context).textTheme.titleSmall,
                                )
                            ],
                          ),
                          actions: [
                            TextButton.icon(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              label: const Text('Tutup'),
                              icon: const Icon(Icons.close),
                            ),
                            TextButton.icon(
                              onPressed: () {
                                GoRouter.of(context).pushNamed(
                                  'chat_detail',
                                  extra: {
                                    'memberId': user[index].id,
                                  },
                                );
                              },
                              label: const Text('Chat'),
                              icon: const Icon(Icons.message_rounded),
                            ),
                          ],
                        ),
                      );
                    });
              },
              subtitle: Text(user[index].email ?? ''),
              leading: user[index].avatar == null
                  ? const CircleAvatar()
                  : CircleAvatar(
                      backgroundImage: NetworkImage(user[index].avatar!)),
              title: Text(user[index].name!.decodeHtml()),
            );
          },
        );
      }, error: (error) {
        return Center(
          child: Text(error),
        );
      });
    });
  }
}
