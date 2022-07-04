import 'package:dio/dio.dart';
import 'package:note_app/data/course/course.dart';
import 'package:note_app/data/get_all_courses/get_all_courses.dart';
import 'package:note_app/data/url.dart';

abstract class ApiCalls {
  Future<List<Course>> getAllCourses();
}

class CourseDB extends ApiCalls {
  final dio = Dio();
  final url = Url();

  @override
  Future<List<Course>> getAllCourses() async {
    final _result =
        await dio.get<GetAllCourses>(url.baseUrl + url.getAllCourses);

    if (_result.data == null) {
      return [];
    } else {
      return _result.data!.data;
    }
  }
}
