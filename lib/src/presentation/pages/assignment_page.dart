import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_pptik/src/extensions/int_extension.dart';
import 'package:lms_pptik/src/extensions/string_extension.dart';
import 'package:lms_pptik/src/presentation/pages/mods/assignment_detail.dart';

import '../../data/models/assignment/assignment.dart';
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return AssignmentDetail(
                            moduleId: assignment.cmid!,
                            assignmentId: assignment.id!,
                            courseId: widget.courseId,
                          );
                        }));
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
}
