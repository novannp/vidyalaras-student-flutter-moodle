import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lms_pptik/src/extensions/int_extension.dart';
import 'package:lms_pptik/src/extensions/string_extension.dart';

import '../../data/models/assignment/assignment.dart';
import '../../data/models/submission_status_model.dart';
import '../../utils/helper/function_helper/function_helper.dart';
import '../blocs/mods/mod_assign/mod_assign_bloc.dart';
import '../blocs/mods/mod_state.dart';

class AssignmentPage extends StatefulWidget {
  const AssignmentPage({super.key, required this.courseId});

  final int courseId;

  @override
  State<AssignmentPage> createState() => _AssignmentPageState();
}

class _AssignmentPageState extends State<AssignmentPage> {
  @override
  void initState() {
    Future.microtask(() {
      context
          .read<GetAssignmentListBloc>()
          .add(ModAssignEvent.getAssignmentList(widget.courseId));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Tugas'),
      ),
      body: BlocBuilder<GetAssignmentListBloc, ModState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            loaded: (assignments) {
              assignments as List<AssignmentModel>;
              return ListView.builder(
                  itemCount: assignments.length,
                  itemBuilder: (context, index) {
                    final assignment = assignments[index];
                    return ListTile(
                      onTap: () {
                        buildAssignmentDetail(assignment);
                      },
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                      ),
                      leading: const Icon(
                        Icons.assignment,
                        color: Colors.deepOrangeAccent,
                      ),
                      title: Text(assignment.name!.decodeHtml()),
                      subtitle: Text(
                          'Deadline: ${assignment.duedate!.toDateAndTime()}'),
                    );
                  });
            },
            orElse: () {
              return const Center(
                child: Text('Tidak ada tugas'),
              );
            },
          );
        },
      ),
    );
  }

  buildAssignmentDetail(AssignmentModel assignment) {
    BlocProvider.of<GetSubmissionStatusBloc>(context)
        .add(ModAssignEvent.getSubmissionStatus(assignment.id!));
    showModalBottomSheet(
        isScrollControlled: true,
        showDragHandle: true,
        useSafeArea: true,
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  assignment.name?.decodeHtml() ?? '',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(),
                Html(data: assignment.intro!.decodeHtml()),
                const Divider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: assignment.introattachments!.map((e) {
                    return ListTile(
                      trailing: Text(e.filesize!.formatFileSize()),
                      subtitle: Text(e.timemodified!.toDateAndTime()),
                      onTap: () {
                        FunctionHelper.downloadFileHandler(
                            context, e.filename!, e.fileurl!);
                      },
                      leading: SvgPicture.network(
                          'https://upload.wikimedia.org/wikipedia/commons/8/87/PDF_file_icon.svg',
                          height: 40),
                      title: Text(e.filename ?? '-'),
                    );
                  }).toList(),
                ),
                const Divider(),
                const Text(
                  'Status Submission',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const Divider(),
                BlocBuilder<GetSubmissionStatusBloc, ModState>(
                    builder: (context, state) {
                  return state.maybeWhen(
                      loading: () => const Center(
                            child: CircularProgressIndicator(),
                          ),
                      error: (message) {
                        return Center(
                          child: Text(message),
                        );
                      },
                      loaded: (submissionStatus) {
                        submissionStatus as SubmissionStatusModel;
                        Lastattempt lastattempt = submissionStatus.lastattempt!;
                        List<Plugins> submissionFiles = submissionStatus
                                .lastattempt?.submission?.plugins
                                ?.where((element) => element.type == 'file')
                                .toList() ??
                            [];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Status',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Chip(
                                label: Text(
                              lastattempt.submission?.status?.decodeHtml() ??
                                  'Belum submit',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            )),
                            const Text(
                              'Status Grading',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Chip(
                                label: Text(
                              lastattempt.graded! ? 'Dinilai' : 'Belum dinilai',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            )),
                            const SizedBox(height: 10),
                            const Text(
                              'Waktu Submit',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            for (Plugins plugin in submissionFiles)
                              for (Fileareas filearea in plugin.fileareas!)
                                if (filearea.files!.isNotEmpty)
                                  for (File file in filearea.files!)
                                    Text(file.timemodified!.toDateAndTime())
                                else
                                  const Text('-'),
                            const SizedBox(height: 10),
                            const Text(
                              'Terakhir diubah',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(lastattempt.submission?.timemodified
                                    ?.toDateAndTime() ??
                                '-'),
                            const SizedBox(height: 10),
                            const Text(
                              'File Submission',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            for (Plugins plugin in submissionFiles)
                              for (Fileareas filearea in plugin.fileareas!)
                                if (filearea.files!.isNotEmpty)
                                  for (File file in filearea.files!)
                                    ListTile(
                                      onTap: () {
                                        FunctionHelper.downloadFileHandler(
                                            context,
                                            file.filename!,
                                            file.fileurl!);
                                      },
                                      title: Text(file.filename!),
                                      subtitle:
                                          Text(file.filesize!.formatFileSize()),
                                      leading: const Icon(Icons.file_copy),
                                    )
                                else
                                  const Text('Tidak ada file submission'),
                            // ListView.builder(
                            //   shrinkWrap: true,
                            //   physics: const NeverScrollableScrollPhysics(),
                            //   itemCount: submissionFiles
                            //           .expand(
                            //               (plugin) => plugin.fileareas ?? [])
                            //           .where((filearea) =>
                            //               filearea.files != null &&
                            //               filearea.files!.isNotEmpty)
                            //           .map<int>(
                            //               (filearea) => filearea.files!.length)
                            //           .fold(
                            //               0,
                            //               (value, element) =>
                            //                   value! + element) ??
                            //       0,
                            //   itemBuilder: (context, index) {
                            //     Plugins plugin = submissionFiles[index ~/ 2];
                            //     Fileareas filearea =
                            //         plugin.fileareas![index % 2];
                            //     if (filearea.files!.isNotEmpty) {
                            //       File file = filearea.files![0];
                            //       return ListTile(
                            //         onTap: () {},
                            //         title: Text(file.filename!),
                            //         subtitle:
                            //             Text(file.filesize!.formatFileSize()),
                            //         leading: const Icon(Icons.file_copy),
                            //       );
                            //     } else {
                            //       return const Text(
                            //           'Tidak ada file submission');
                            //     }
                            //   },
                            // ),
                            const SizedBox(height: 10),
                            const Divider(),
                            const Text(
                              'Feedback',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Nilai'),
                              trailing: Text(submissionStatus
                                      .feedback?.gradefordisplay
                                      ?.decodeHtml() ??
                                  '-'),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Dinilai pada'),
                              trailing: Text(submissionStatus
                                      .feedback?.gradeddate
                                      ?.toDateAndTime() ??
                                  '-'),
                            ),
                            const Text(
                              'Komentar',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            for (Plugins plugin
                                in submissionStatus.feedback?.plugins ?? [])
                              for (Editorfields comment
                                  in plugin.editorfields ?? [])
                                Html(data: comment.text ?? '-'),
                            const SizedBox(height: 10),
                          ],
                        );
                      },
                      orElse: () {
                        return const Center(
                          child: Text('Tidak ada data'),
                        );
                      });
                })
              ],
            ),
          );
        });
  }
}
