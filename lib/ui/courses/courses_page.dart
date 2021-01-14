import 'package:flutter/material.dart';
import 'package:rw_courses/constants.dart';
import 'package:rw_courses/model/course.dart';
import 'package:rw_courses/repository/_repository.dart';
import 'package:rw_courses/ui/courses/courses_controller.dart';

class CoursesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CoursesStatePage();
}

class _CoursesStatePage extends State<CoursesPage> {
  final _controller = CoursesController(CourseRepository());

  @override
  Widget build(BuildContext context) => FutureBuilder<List<Course>>(
        future: _controller.fetchCourses(Constants.allFilter),
        builder: (context, snapshot) {
          var courses = snapshot.data;
          if (courses == null) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: courses.length,
            itemBuilder: (context, index) => _buildRow(courses[index]),
          );
        },
      );

  Widget _buildRow(Course course) => ListTile(
        title: Text(course.name),
        trailing: Image.network(course.artworkUrl),
      );
}
