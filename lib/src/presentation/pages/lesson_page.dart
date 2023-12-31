import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_pptik/src/data/models/lesson_model/lesson.dart';
import 'package:lms_pptik/src/extensions/string_extension.dart';
import 'package:lms_pptik/src/presentation/blocs/mods/mod_lesson/mod_lesson_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../blocs/mods/mod_state.dart';

class LessonPage extends StatefulWidget {
  final int courseId;

  const LessonPage({super.key, required this.courseId});

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  @override
  void initState() {
    context
        .read<GetLessonByCourseBloc>()
        .add(ModLessonEvent.getLessonByCourse(widget.courseId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Pembelajaran'),
      ),
      body: BlocBuilder<GetLessonByCourseBloc, ModState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            loaded: (lessons) {
              lessons as List<Lesson>;
              if (lessons.isEmpty) {
                return const Center(
                  child: Text('Tidak ada Pembelajaran'),
                );
              }
              return ListView.builder(
                  itemCount: lessons.length,
                  itemBuilder: (context, index) {
                    final lesson = lessons[index];
                    return ListTile(
                      onTap: () {
                        // GoRouter.of(context).pushNamed('detail-lesson', extra: lesson.id);
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  title: const Text("Info"),
                                  content: const Text(
                                      "pembelajaran ini belum didukung, silahkan buka di browser"),
                                  actions: [
                                    TextButton(
                                        onPressed: Navigator.of(context).pop,
                                        child: const Text("Kembali")),
                                    ElevatedButton(
                                        onPressed: () async {
                                          await launchUrlString(
                                              "https://lms.pptik.id/mod/lesson/view.php?id=${lesson.coursemodule}");
                                          if(!mounted)return;
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("Buka")),
                                  ],
                                ));
                      },
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                      ),
                      leading: const Icon(
                        Icons.ondemand_video_outlined,
                        color: Colors.deepOrangeAccent,
                      ),
                      title: Text(lesson.name!.decodeHtml()),
                    );
                  });
            },
            orElse: () {
              return const Center(
                child: Text('Tidak ada Pembelajaran'),
              );
            },
          );
        },
      ),
    );
  }
}
