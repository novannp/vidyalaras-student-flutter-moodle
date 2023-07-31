import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_pptik/src/extensions/string_extension.dart';
import 'package:lms_pptik/src/presentation/blocs/mods/mod_assign/mod_assign_bloc.dart';
import 'package:lms_pptik/src/presentation/blocs/mods/mod_state.dart';
import 'package:lms_pptik/src/presentation/blocs/upload/upload_file_bloc.dart';

import '../../../data/models/assignment/assignment.dart';
import '../../../extensions/int_extension.dart';

class SubmissionPage extends StatefulWidget {
  const SubmissionPage({super.key, required this.assignment});
  final AssignmentModel assignment;
  @override
  State<SubmissionPage> createState() => _AssignmentUploadPageState();
}

class _AssignmentUploadPageState extends State<SubmissionPage> {
  openFilePicker() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null) {
      final files = result.files;
      return files.map((e) => File(e.path!)).toList();
    }
  }

  final List<File> tempFiles = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.assignment.name!.decodeHtml()),
        actions: [
          FilledButton.icon(
            style: FilledButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Theme.of(context).appBarTheme.foregroundColor),
            onPressed: () {
              openFilePicker().then((value) {
                if (value != null) {
                  setState(() {
                    tempFiles.addAll(value);
                  });
                }
              });
            },
            icon: const Icon(Icons.add_box_outlined),
            label: const Text('Upload'),
          ),
        ],
      ),
      body: BlocListener<SubmitSubmissionBloc, ModState>(
        listener: (context, state) {
          state.whenOrNull(
            loaded: (data) {
              data as bool;
              if (data == true) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Berhasil mengumpulkan tugas'),
                  ),
                );
                context.read<GetSubmissionStatusBloc>().add(
                    ModAssignEvent.getSubmissionStatus(widget.assignment.id!));

                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                        'Gagal mengumpulkan tugas,perhatikan format dan ukuran file'),
                  ),
                );
              }
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                'Unggah Tugas',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              if (widget.assignment.configs != null)
                Builder(builder: (context) {
                  final fileSize = widget.assignment.configs?.firstWhere(
                      (element) => element.name == 'maxsubmissionsizebytes');
                  final fileLimit = widget.assignment.configs?.firstWhere(
                      (element) => element.name == 'maxfilesubmissions');
                  return Center(
                    child: Text(
                      'Ukuran maksimum file: ${int.parse(fileSize!.value!).formatFileSize()}, jumlah file maksimum: ${int.parse(fileLimit!.value!)}',
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  );
                }),
              Builder(builder: (context) {
                final allowedExtension = widget.assignment.configs
                    ?.firstWhere((element) => element.name == 'filetypeslist');
                return Center(
                  child: Text(
                    'Format file yang diizinkan: ${allowedExtension!.value == '' ? 'Semua' : allowedExtension.value!} ',
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                );
              }),
              const SizedBox(height: 10),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: tempFiles.length,
                  itemBuilder: (context, index) {
                    final file = tempFiles[index];
                    return ListTile(
                      leading: const Icon(
                        Icons.insert_drive_file,
                        color: Colors.deepOrangeAccent,
                      ),
                      title: Text(file.path.split('/').last),
                      trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              tempFiles.removeAt(index);
                            });
                          },
                          icon: const Icon(Icons.delete)),
                    );
                  }),
              const SizedBox(height: 10),
              BlocListener<UploadFileBloc, UploadFileState>(
                listener: (context, state) {
                  state.whenOrNull(
                    loaded: (data) {
                      Navigator.pop(context, data);

                      context.read<SubmitSubmissionBloc>().add(
                          ModAssignEvent.submitSubmission(
                              widget.assignment.id!, data.first.itemid!));
                    },
                    loading: () {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CircularProgressIndicator(),
                                  Text('Mengunggah file...'),
                                ],
                              ),
                            );
                          });
                    },
                  );
                },
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                      onPressed: () {
                        if (tempFiles.isNotEmpty) {
                          context
                              .read<UploadFileBloc>()
                              .add(UploadFileEvent.uploadFile(tempFiles));
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('File tidak boleh kosong'),
                          ));
                        }
                      },
                      icon: const Icon(Icons.send),
                      label: const Text('Kirim')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
