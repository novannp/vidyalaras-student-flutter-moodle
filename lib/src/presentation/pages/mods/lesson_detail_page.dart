import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:lms_pptik/src/data/models/lesson_model/lesson.dart';
import 'package:lms_pptik/src/extensions/string_extension.dart';
import 'package:lms_pptik/src/presentation/blocs/mods/mod_lesson/mod_lesson_bloc.dart';
import 'package:lms_pptik/src/presentation/blocs/mods/mod_state.dart';

import '../../../data/models/pages.dart';

class LessonDetailPage extends StatefulWidget {
  final int lessonId;

  const LessonDetailPage(this.lessonId, {super.key});

  @override
  State<LessonDetailPage> createState() => _LessonDetailPageState();
}

class _LessonDetailPageState extends State<LessonDetailPage> {
  @override
  void initState() {
    Future.microtask(() {
      context
          .read<GetLessonBloc>()
          .add(ModLessonEvent.getLesson(widget.lessonId));
      context
          .read<GetPagesLessonBloc>()
          .add(ModLessonEvent.getPagesLesson(widget.lessonId));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetLessonBloc, ModState>(builder: (context, state) {
      return state.maybeWhen(loaded: (data) {
        data as Lesson;
        return Scaffold(
          appBar: AppBar(
              title: Text(
            data.name?.decodeHtml() ?? "",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )),
          body: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Divider(),
                    Html(data: data.intro!),
                    const Divider(),

                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  child: BlocBuilder<GetPagesLessonBloc, ModState>(
                    builder: (context, state) {
                      return state.maybeWhen(loaded: (pages) {
                        pages as List<PageLesson>;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(onPressed: (){},child: Text("${pages[0].page?.prevpageid}")),
                            ElevatedButton(onPressed: (){},child: Text("${pages[0].page?.nextpageid}")),
                          ],
                        );
                      }, orElse: () {
                        return const SizedBox();
                      });
                    },
                  ),
                ),
              ),
            ],
          ),

        );
      }, loading: () {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }, orElse: () {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: const Text("Detail Pembelajaran"),
          ),
          body: const Center(
            child: Text("Tidak ada Pembelajaran"),
          ),
        );
      });
    });
  }
}

class PageIndexCubit extends Cubit<int> {
  PageIndexCubit() : super(0);

  nextPage()=> emit(state + 1);
  previousPage()=> emit(state -1);
}
