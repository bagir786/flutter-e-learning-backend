import 'package:flutter/material.dart';

class CourseListPage extends StatelessWidget {
  final int? courseId;

  const CourseListPage({super.key, this.courseId});

  @override
  Widget build(BuildContext context) {
    print(courseId);
    return Scaffold(
      appBar: AppBar(title: Text('Course Page'), centerTitle: true),
      body: Center(child: Text('Course Id Nomor : $courseId', style: TextStyle(fontSize: 24))),
    );
  }
}
