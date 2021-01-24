import 'package:flutter/material.dart';
import 'package:rw_courses/model/course.dart';
import 'package:rw_courses/ui/course_detail/image_container.dart';
import 'package:rw_courses/utils/string_extensions.dart';

class CourseDetailPage extends StatelessWidget {
  final Course course;

  CourseDetailPage({Key key, this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(course.name),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBanner(),
            _buildMain(context),
            _buildDetails(context),
          ],
        ),
      );

  Widget _buildBanner() => ImageContainer(
        height: 200,
        url: course.artworkUrl,
      );

  Widget _buildMain(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              course.name,
              style:
                  Theme.of(context).textTheme.subtitle2.copyWith(fontSize: 24),
            ),
            Text(course.description,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300))
          ],
        ),
      );

  Widget _buildDetails(BuildContext context) {
    final style = TextStyle(fontSize: 16);

    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Domain(s): ${course.domainsString}',
            style: style,
          ),
          Text(
            'Level: ${course.difficulty.capitalize()}',
            style: style,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Contributors: ${course.contributors}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
