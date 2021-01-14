import 'package:flutter_test/flutter_test.dart';
import 'package:rw_courses/model/course.dart';

void main() {
  test('Test course', () {
    final Course course = Course('courseId', "name", "description",
        "artworkUrl", "difficulty", "contributors", []);
    expect(course.courseId, "courseId");
    expect(course.name, "name");
    expect(course.contributors, "contributors");
    expect(course.difficulty, "difficulty");
    expect(course.artworkUrl, "artworkUrl");
    expect(course.description, "description");
  });
}
