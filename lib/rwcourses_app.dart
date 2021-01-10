import 'package:flutter/material.dart';
import 'package:rw_courses/strings.dart';
import 'package:rw_courses/ui/courses/courses_page.dart';

class RWCoursesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appTitle),
      ),
      body: CoursesPage(),
    );
  }
}
