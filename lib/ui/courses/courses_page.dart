import 'package:flutter/material.dart';
import 'package:rw_courses/constants.dart';
import 'package:rw_courses/model/course.dart';
import 'package:rw_courses/ui/courses/courses_controller.dart';

class CoursesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CoursesStatePage();
}

class _CoursesStatePage extends State<CoursesPage> {
  final _controller = CoursesController();

  @override
  Widget build(BuildContext context) => FutureBuilder<List<Course>>(
        future: _controller.fetchCourses(Constants.allFilter),
        builder: (context, snapshot) {
          var courses = snapshot.data;
          if (courses == null) {
            return Center(child: CircularProgressIndicator());
          }
          return Text(courses.toString());
        },
      );
}
