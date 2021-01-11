import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rw_courses/constants.dart';
import 'package:rw_courses/model/course.dart';
import 'package:rw_courses/repository/repository.dart';

class CourseRepository implements Repository {
  String dataUrl =
      "https://api.raywenderlich.com/api/contents?filter[content_types][]=collection";

  @override
  Future<List<Course>> getCourses(int domainFilter) async {
    var courses = <Course>[];

    var url = dataUrl;
    if (domainFilter != Constants.allFilter) {
      url += "&filter[domain_ids][]=$domainFilter";
    }

    http.Response response = await http.get(url);
    final apiResponse = json.decode(response.body);

    return courses;
  }
}
