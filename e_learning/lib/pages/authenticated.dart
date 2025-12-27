import 'package:e_learning/course/course_bloc.dart';
import 'package:e_learning/data/repository/apiRepository.dart';
import 'package:e_learning/pages/course_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticatedPage extends StatelessWidget {
  const AuthenticatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Authenticated Page'), centerTitle: true),
      body: BlocProvider(
        create: (context) => CourseBloc(Apirepository())..add(GetCourse()),
        child: BlocBuilder<CourseBloc, CourseState>(
          builder: (context, state) {
            if (state is CourseInitial) {
              return const Center(child: const CircularProgressIndicator());
            }
            if (state is CourseLoaded) {
              final courses = state.courseResponse.data;

              return ListView.builder(
                itemCount: courses?.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CourseListPage(courseId: courses?[index].id),
                        ),
                      );
                    },
                    child: ListTile(title: Text(courses?[index].name ?? '')),
                  );
                },
              );
            } else if (state is CourseFailed) {
              return Center(child: Text(state.message));
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
