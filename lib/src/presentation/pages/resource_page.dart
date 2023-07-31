import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lms_pptik/src/extensions/string_extension.dart';
import 'package:lms_pptik/src/presentation/blocs/mods/mod_resource/mod_resource_bloc.dart';
import 'package:lms_pptik/src/presentation/blocs/mods/mod_state.dart';
import 'package:lms_pptik/src/utils/helper/function_helper/function_helper.dart';

import '../../data/models/course_model.dart';
import '../../data/models/resource_model/resource.dart';
import '../../extensions/int_extension.dart';

class ResourcePage extends StatefulWidget {
  const ResourcePage({super.key, required this.course});
  final CourseModel course;
  @override
  State<ResourcePage> createState() => _ResourcePageState();
}

class _ResourcePageState extends State<ResourcePage> {
  @override
  void initState() {
    Future.microtask(() {
      context
          .read<GetResourceByCourseBloc>()
          .add(ModResourceEvent.getResourceByCourse(widget.course.id!));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: const Text(
            'File',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(widget.course.fullname?.decodeHtml() ?? '-'),
        ),
      ),
      body: BlocBuilder<GetResourceByCourseBloc, ModState>(
        builder: (context, state) {
          return state.maybeWhen(error: (message) {
            return Center(
              child: Text(message),
            );
          }, loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }, loaded: (resources) {
            resources as List<ResourceModel>;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: resources.length,
                itemBuilder: (context, index) {
                  final resource = resources[index];
                  return ExpansionTile(
                      title: Text(
                        resource.name ?? '-',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      children: [
                        ListView.separated(
                            separatorBuilder: (context, index) => const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Divider(),
                                ),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: resource.contentfiles?.length ?? 0,
                            itemBuilder: (context, i) {
                              final file = resource.contentfiles?[i];
                              return ListTile(
                                leading: SvgPicture.asset(
                                  'assets/img/file.svg',
                                  height: 40,
                                  width: 40,
                                ),
                                title: Text(file?.filename ?? '-'),
                                subtitle: Text(
                                    file?.filesize?.formatFileSize() ?? '-'),
                                trailing: IconButton(
                                  onPressed: () {
                                    context.read<ViewResourceBloc>().add(
                                        ModResourceEvent.viewResource(
                                            resource.id!));
                                    FunctionHelper.downloadFileHandler(
                                        context,
                                        file!.filename!.decodeHtml(),
                                        file.fileurl!);
                                  },
                                  icon: const Icon(
                                    Icons.download_rounded,
                                    color: Colors.black,
                                  ),
                                ),
                              );
                            }),
                      ]);
                },
              ),
            );
          }, orElse: () {
            return const SizedBox();
          });
        },
      ),
    );
  }
}
