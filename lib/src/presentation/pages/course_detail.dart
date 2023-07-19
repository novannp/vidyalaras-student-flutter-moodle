import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_pptik/src/data/models/materi_model.dart';
import 'package:lms_pptik/src/data/models/user_model.dart';
import 'package:lms_pptik/src/extensions/string_extension.dart';

import '../../data/models/course_model.dart';
import '../blocs/course/course_bloc.dart';
import '../components/course_card.dart';

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
      appBar: AppBar(
        title: Text(widget.course.fullname!.decodeHtml()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            CourseCard(course: widget.course),
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
                  const Text('Nilai'),
                ],
              ),
            ),
          ],
        ),
      ),
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
