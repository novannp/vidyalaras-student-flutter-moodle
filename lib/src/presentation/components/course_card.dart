import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_pptik/src/extensions/string_extension.dart';
import 'package:lms_pptik/src/presentation/blocs/course/course_bloc.dart';

import '../../data/models/course_model.dart';
import '../../utils/constant.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
    this.onTap,
    this.showMenu = false,
    required this.course,
  });

  final CourseModel course;
  final Function()? onTap;
  final bool? showMenu;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 120,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Container(
                width: 30,
                height: double.infinity,
                color: flatColor[Random().nextInt(7)],
                child: const Icon(Icons.book, color: Colors.white),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.fullname!.decodeHtml(),
                        style: const TextStyle(
                          fontSize: 16,
                          // color: Colors.white,
                        ),
                      ),
                      Text(course.coursecategory!.decodeHtml()),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 20,
                                width: 20,
                                child: course.progress == null
                                    ? const SizedBox()
                                    : CircularProgressIndicator(
                                        value:
                                            (course.progress!.toDouble() / 100),
                                      ),
                              ),
                              const SizedBox(width: 10),
                              course.progress != null
                                  ? Text('${course.progress}% Selesai')
                                  : const SizedBox()
                            ],
                          ),
                          showMenu == false
                              ? const SizedBox()
                              : buildMenuButton(context)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BlocListener<AddCourseToFavouriteBloc, CourseState> buildMenuButton(
      BuildContext context) {
    return BlocListener<AddCourseToFavouriteBloc, CourseState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loading: () {
            Navigator.pop(context);
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return const LoadingDialog();
              },
            );
          },
          loadedWithoutData: () {
            Navigator.of(context).pop();
            context.read<GetFilteredCourseBloc>().add(
                  const CourseEvent.getFilteredCourse('all'),
                );
            showDialog(
              context: context,
              builder: (context) {
                Future.delayed(const Duration(seconds: 1), () {
                  Navigator.pop(context);
                });
                return const SuccessDialog();
              },
            );
          },
        );
      },
      child: IconButton(
        onPressed: () {
          showModalBottomSheet(
            showDragHandle: true,
            context: context,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                ),
                child: Wrap(
                  children: [
                    if (course.isfavourite!)
                      ListTile(
                        onTap: () {
                          context.read<AddCourseToFavouriteBloc>().add(
                                CourseEvent.addCourseToFavorite(course),
                              );
                        },
                        leading: const Icon(Icons.delete),
                        title: const Text(
                          'Hapus dari favorit',
                        ),
                      )
                    else
                      ListTile(
                        onTap: () {
                          context.read<AddCourseToFavouriteBloc>().add(
                                CourseEvent.addCourseToFavorite(course),
                              );
                        },
                        leading: const Icon(Icons.star),
                        title: const Text(
                          'Tambahkan ke favorit',
                        ),
                      ),
                    const ListTile(
                      title: Text('Sembunyikan'),
                      leading: Icon(
                        Icons.remove_red_eye_outlined,
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
        icon: const Icon(Icons.more_vert, size: 20),
      ),
    );
  }
}

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [CircularProgressIndicator()],
      ),
    );
  }
}

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 50,
          ),
          Text('Berhasil'),
        ],
      ),
    );
  }
}
