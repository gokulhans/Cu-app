import 'package:dio/dio.dart';
import 'package:note_app/data/course/course.dart';
import 'package:note_app/data/get_all_courses/get_all_courses.dart';
import 'package:note_app/data/url.dart';

abstract class ApiCalls {
  Future test();
}

class CourseDB extends ApiCalls {
  final dio = Dio();
  final url = Url();

  @override
  Future test() async {
    final testurl =
        'https://cugram.herokuapp.com/Bca/Semester-1/MFCA/Previous-Question-Papers';
    final _result = await dio.get(testurl);

    if (_result.data == null) {
      return ['failed'];
    } else {
      print(_result.data!.data);
      return _result.data;
    }
  }
}
