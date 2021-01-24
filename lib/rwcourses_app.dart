import 'package:flutter/material.dart';
import 'package:rw_courses/filter/filter.dart';
import 'package:rw_courses/strings.dart';
import 'package:rw_courses/ui/courses/courses_page.dart';

class RWCoursesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => FilterPage()),
                    )
                  })
        ],
        title: Text(Strings.appTitle),
      ),
      body: CoursesPage(),
    );
  }
}
