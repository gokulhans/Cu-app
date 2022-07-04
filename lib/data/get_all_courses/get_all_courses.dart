import 'package:json_annotation/json_annotation.dart';
import 'package:note_app/data/course/course.dart';

part 'get_all_courses.g.dart';

@JsonSerializable()
class GetAllCourses {
  @JsonKey(name: 'data')
  List<Course> data;

  GetAllCourses({this.data = const []});

  factory GetAllCourses.fromJson(Map<String, dynamic> json) {
    return _$GetAllCoursesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetAllCoursesToJson(this);
}
