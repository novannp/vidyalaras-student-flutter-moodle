import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_pptik/src/data/models/course_model.dart';

import '../blocs/course/course_bloc.dart';
import '../components/course_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cari Kelas'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextField(
              controller: _searchController,
              autofocus: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                prefixIcon: const Icon(Icons.search),
                hintText: 'Cari Kelas',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                context
                    .read<SearchCourseBloc>()
                    .add(CourseEvent.searchCourse(value));
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<SearchCourseBloc, CourseState>(
                builder: (context, state) {
                  return state.maybeWhen(initial: () {
                    return const Center(
                      child: Text('Silahkan cari kelas'),
                    );
                  }, loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }, loaded: (courses) {
                    courses as List<CourseModel>;
                    if (courses.isEmpty) {
                      return const Center(
                        child: Text('Kelas tidak ditemukan'),
                      );
                    }
                    return ListView.builder(
                        itemCount: courses.length,
                        itemBuilder: (context, index) {
                          final course = courses[index];
                          return CourseCard(course: course);
                        });
                  }, orElse: () {
                    return const Center(
                      child: Text('Gagal melakukan pencarian keals'),
                    );
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
