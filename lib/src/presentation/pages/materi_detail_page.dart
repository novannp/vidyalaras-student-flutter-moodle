import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:lms_pptik/src/data/models/materi_model/content.dart';
import 'package:lms_pptik/src/data/models/materi_model/module.dart';
import 'package:lms_pptik/src/extensions/string_extension.dart';
import 'package:lms_pptik/src/extensions/int_extension.dart';
import 'package:lms_pptik/src/presentation/blocs/course/course_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../data/models/materi_model/date_model.dart';
import '../../data/models/materi_model/materi_model.dart';
import '../../utils/helper/function_helper/function_helper.dart';
import '../blocs/completion/completion_bloc.dart';
import '../blocs/mods/mod_resource/mod_resource_bloc.dart';
import 'mods/assignment_detail.dart';

class CompletionButton extends StatelessWidget {
  const CompletionButton({super.key, required this.mod});

  final Module mod;

  @override
  Widget build(BuildContext context) {
    if (mod.completiondata!.state == 1) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.only(bottom: 10),
        width: double.infinity,
        child: FilledButton.tonalIcon(
          icon: const Icon(Icons.check),
          onPressed: () {
            context
                .read<SelfCompletionBloc>()
                .add(CompletionEvent.selfCompletion(mod.id!, 0));
          },
          label: const Text('Selesai'),
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.only(bottom: 10),
        width: double.infinity,
        child: OutlinedButton(
          onPressed: () {
            context
                .read<SelfCompletionBloc>()
                .add(CompletionEvent.selfCompletion(mod.id!, 1));
          },
          child: const Text('Tandai Selesai'),
        ),
      );
    }
  }
}

class MateriDetailPage extends StatefulWidget {
  const MateriDetailPage(
      {super.key, required this.selectedIndex, required this.courseId});

  final int selectedIndex;
  final int courseId;

  @override
  State<MateriDetailPage> createState() => _MateriDetailPageState();
}

class _MateriDetailPageState extends State<MateriDetailPage> {
  Widget buildModTile(MateriModel materi) {
    return ListView.separated(
      separatorBuilder: (context, i) => const Divider(),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: materi.modules!.length,
      itemBuilder: (context, i) {
        final mod = materi.modules![i];
        switch (mod.modname) {
          case 'assign':
            return AssignmentTile(mod: mod, courseId: widget.courseId);
          case 'forum':
            return ForumTile(mod: mod, courseId: widget.courseId);
          case 'lesson':
            return LessonTile(mod: mod, courseId: widget.courseId);
          case 'page':
            return Card(
              child: ListTile(
                leading: const Icon(
                  Icons.pages,
                  size: 40,
                  color: Colors.blue,
                ),
                title: Text(mod.name!.decodeHtml()),
              ),
            );
          case 'resource':
            if (mod.contents != null) {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: mod.contents!.length,
                  itemBuilder: (context, selectedIndex) {
                    final content = mod.contents![selectedIndex];
                    return ResourceTile(content: content, mod: mod);
                  });
            } else {
              return Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: mod.modicon != null
                          ? SizedBox(
                              height: 40,
                              width: 40,
                              child: SvgPicture.asset('assets/img/file.svg'))
                          : const Icon(Icons.file_copy, size: 40),
                      title: Text(mod.name!.decodeHtml()),
                    ),
                    if (mod.availabilityinfo != null)
                      Html(data: mod.availabilityinfo)
                  ],
                ),
              );
            }

          case 'quiz':
            return QuizTile(mod: mod);
          case 'label':
            return LabelTile(mod: mod);
          case 'wiki':
            return const WikiTile();
          case 'workshop':

            ///TODO modul workshop belum tersedia
            return WorkshopTile(mod: mod, courseId: mod.id!);
          default:
            return Card(
              child: ListTile(
                onTap: () {
                  _showDialogNotSupport(context, mod);
                },
                leading: const Icon(Icons.bookmarks_rounded),
                title: Text(mod.name!.decodeHtml()),
              ),
            );
        }
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return BlocListener<SelfCompletionBloc, CompletionState>(
      listener: (context, state) {
        state.whenOrNull(loaded: (data) {
          context
              .read<GetMateriBloc>()
              .add(CourseEvent.getMateri(widget.courseId));
        });
      },
      child: BlocBuilder<GetMateriBloc, CourseState>(
        builder: (context, state) {
          return DraggableScrollableSheet(
              expand: false,
              builder: (context, controller) {
                return SingleChildScrollView(
                  controller: controller,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: state.whenOrNull(
                        loaded: (data) {
                          data as List<MateriModel>;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                data[widget.selectedIndex].name!.decodeHtml(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Divider(),
                              const SizedBox(height: 10),
                              data[widget.selectedIndex].summary != null
                                  ? Html(
                                      data: data[widget.selectedIndex].summary)
                                  : const SizedBox(),
                              ExpansionTile(
                                initiallyExpanded: true,
                                title: const Text(
                                  'Modul',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                children: [
                                  if (data[widget.selectedIndex].modules !=
                                      null)
                                    if (data[widget.selectedIndex]
                                        .modules!
                                        .isNotEmpty)
                                      buildModTile(data[widget.selectedIndex])
                                    else
                                      const Center(
                                        child: Text('Tidak ada modul'),
                                      )
                                ],
                              ),
                              const SizedBox(height: 10),
                            ],
                          );
                        },
                      ) ??
                      const SizedBox(),
                );
              });
        },
      ),
    );
  }
}

class WorkshopTile extends StatelessWidget {
  const WorkshopTile({
    super.key,
    required this.mod, required this.courseId,
  });

  final Module mod;
  final int courseId;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
                onTap: () {
                  _showDialogNotSupport(context, mod);
                },
                leading: const Icon(Icons.people_alt_rounded,
                    size: 40, color: Colors.green),
                title: Text(
                  mod.name!.decodeHtml(),
                ),
                trailing: !mod.uservisible!
                    ? const Icon(
                        Icons.lock,
                        color: Colors.red,
                      )
                    : null,
                subtitle:
                    !mod.uservisible! ? null : CompletionButton(mod: mod)),
            const SizedBox(height: 8),
            mod.dates!.isNotEmpty
                ? Column(
                    children: [
                      if (mod.dates!.isNotEmpty)
                        for (DateModel date in mod.dates!)
                          Row(
                            children: [
                              const Icon(Icons.calendar_month, size: 20),
                              Text.rich(
                                TextSpan(
                                  text: date.label!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(fontWeight: FontWeight.w600),
                                  children: [
                                    TextSpan(
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                      text: DateTime.fromMillisecondsSinceEpoch(
                                              date.timestamp! * 1000)
                                          .toString()
                                          .formatDate(),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                      if (mod.availabilityinfo != null)
                        Html(data: mod.availabilityinfo)
                    ],
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}

class WikiTile extends StatelessWidget {
  const WikiTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: ListTile(
        leading: Icon(Icons.wysiwyg, size: 40, color: Colors.green),
        title: Text('Wiki'),
      ),
    );
  }
}

class LabelTile extends StatelessWidget {
  const LabelTile({
    super.key,
    required this.mod,
  });

  final Module mod;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mod.name!.decodeHtml(),
            ),
            const SizedBox(height: 8),
            CompletionButton(mod: mod)
          ],
        ),
      ),
    );
  }
}

class QuizTile extends StatelessWidget {
  const QuizTile({
    super.key,
    required this.mod,
  });

  final Module mod;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: InkWell(
            onTap: mod.uservisible! == true ? () {
              _showDialogNotSupport(context, mod);
            } : null,
            child: Column(
              children: [
                ListTile(
                  trailing: mod.uservisible! == true
                      ? const SizedBox()
                      : const Icon(Icons.lock, color: Colors.red),
                  leading: const Icon(
                    Icons.task,
                    size: 40,
                    color: Colors.cyan,
                  ),
                  title: Text(
                    mod.name!.decodeHtml(),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: Column(
                    children: [
                      if (mod.dates!.isNotEmpty)
                        for (DateModel date in mod.dates!)
                          Row(
                            children: [
                              const Icon(Icons.calendar_month, size: 20),
                              Text.rich(
                                TextSpan(
                                  text: date.label!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(fontWeight: FontWeight.w600),
                                  children: [
                                    TextSpan(
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                      text: DateTime.fromMillisecondsSinceEpoch(
                                              date.timestamp! * 1000)
                                          .toString()
                                          .formatDate(),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        if (mod.availabilityinfo != null) Html(data: mod.availabilityinfo),
        if (mod.description != null) Html(data: mod.description),
      ],
    );
  }
}

class ResourceTile extends StatelessWidget {
  const ResourceTile({
    super.key,
    required this.content,
    required this.mod,
  });

  final ContentModel content;
  final Module mod;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            subtitle: Text('${content.filesize?.formatFileSize() ?? '-'} '),
            trailing: IconButton.filled(
                onPressed: () {
                  context
                      .read<ViewResourceBloc>()
                      .add(ModResourceEvent.viewResource(mod.instance!));
                  FunctionHelper.downloadFileHandler(
                      context,
                      content.filename ?? '',
                      (content.fileurl ?? '')
                          .replaceAll('?forcedownload=1', ''));
                },
                icon: const Icon(Icons.download)),
            leading: mod.modicon != null
                ? SizedBox(
                    height: 40,
                    width: 40,
                    child: SvgPicture.asset('assets/img/file.svg'))
                : const Icon(Icons.file_copy, size: 40),
            title: Text(
              mod.name!.decodeHtml(),
            ),
          ),
          if (mod.completiondata!.details!.isNotEmpty)
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.start,
              children: mod.completiondata?.details?.map((e) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Chip(
                        padding: EdgeInsets.zero,
                        labelStyle: const TextStyle(fontSize: 12),
                        backgroundColor: e.rulevalue!.status == 1
                            ? Colors.green.withOpacity(0.2)
                            : Colors.red.withOpacity(0.2),
                        label: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            e.rulevalue!.status == 1
                                ? const Icon(Icons.check, size: 16)
                                : const Icon(Icons.close, size: 16),
                            const SizedBox(width: 5),
                            Text(e.rulevalue!.description!),
                          ],
                        ),
                      ),
                    );
                  }).toList() ??
                  [],
            ),
          if (mod.uservisible == false)
            if (mod.completiondata != null) CompletionButton(mod: mod)
        ],
      ),
    );
  }
}

class LessonTile extends StatelessWidget {
  const LessonTile({
    super.key,
    required this.mod, required this.courseId,
  });

  final Module mod;
  final int courseId;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            onTap: () {
              _showDialogNotSupport(context, mod);
            },
            leading: mod.modicon != null
                ? const SizedBox(
                    height: 40,
                    width: 40,
                    child: Icon(
                      Icons.play_lesson,
                      size: 40,
                      color: Colors.indigo,
                    ))
                : const Icon(Icons.file_copy, size: 40),
            title: Text(
              mod.name!.decodeHtml(),
            ),
          ),
          CompletionButton(mod: mod)
        ],
      ),
    );
  }
}

class ForumTile extends StatelessWidget {
  const ForumTile({
    super.key,
    required this.mod, required this.courseId,
  });

  final Module mod;
  final int courseId;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          _showDialogNotSupport(context, mod);
        },
        leading: const Icon(Icons.forum, size: 40, color: Colors.orange),
        title: Text(
          mod.name!.decodeHtml(),
        ),
      ),
    );
  }
}

class AssignmentTile extends StatelessWidget {
  const AssignmentTile({super.key, required this.mod, required this.courseId});

  final Module mod;
  final int courseId;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
      onTap: mod.uservisible! == true
          ? () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return AssignmentDetail(
                    moduleId: mod.id!,
                    assignmentId: mod.instance!,
                    courseId: courseId,
                  );
                },
              ));
            }
          : null,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              trailing: mod.uservisible! == true
                  ? null
                  : const Icon(Icons.lock, color: Colors.red),
              subtitle: mod.completiondata!.details!.isNotEmpty
                  ? Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      alignment: WrapAlignment.start,
                      children: mod.completiondata?.details?.map((e) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Chip(
                                padding: EdgeInsets.zero,
                                labelStyle: const TextStyle(fontSize: 12),
                                backgroundColor: e.rulevalue!.status == 1
                                    ? Colors.green.withOpacity(0.2)
                                    : Colors.red.withOpacity(0.2),
                                label: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    e.rulevalue!.status == 1
                                        ? const Icon(Icons.check, size: 16)
                                        : const Icon(Icons.close, size: 16),
                                    const SizedBox(width: 5),
                                    Text(e.rulevalue!.description!),
                                  ],
                                ),
                              ),
                            );
                          }).toList() ??
                          [],
                    )
                  : null,
              leading: const Icon(
                Icons.assignment,
                size: 40,
                color: Colors.amber,
              ),
              title: Text(
                mod.name!.decodeHtml(),
              ),
            ),
            mod.description != null
                ? Html(data: mod.description!)
                : const SizedBox(),
            Column(
              children: [
                if (mod.dates!.isNotEmpty)
                  for (DateModel date in mod.dates!)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          const Icon(Icons.calendar_month, size: 20),
                          Text.rich(
                            TextSpan(
                              text: date.label!,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(fontWeight: FontWeight.w600),
                              children: [
                                TextSpan(
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                  text: DateTime.fromMillisecondsSinceEpoch(
                                          date.timestamp! * 1000)
                                      .toString()
                                      .formatDate(),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                if (mod.uservisible! == true)
                  if (mod.completiondata!.details!.isEmpty)
                    CompletionButton(mod: mod)
              ],
            )
          ],
        ),
      ),
    ));
  }
}

_showDialogNotSupport(BuildContext context, Module mod){
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Info"),
          content: const Text('Aktivitas ini belum didukung, silahkan buka di browser'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Kembali')),
            ElevatedButton(
              onPressed: () async {
                print("https://lms.pptik.id/mod/${mod.modname}/view.php?id=${mod.id}");
                await launchUrlString(
                    "https://lms.pptik.id/mod/${mod.modname}/view.php?id=${mod.id}");
                if(!context.mounted)return;
                Navigator.of(context).pop();
              },
              child: Text("Buka"),
            ),
          ],
        );
      });
}
