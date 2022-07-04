// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_courses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllCourses _$GetAllCoursesFromJson(Map<String, dynamic> json) =>
    GetAllCourses(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Course.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$GetAllCoursesToJson(GetAllCourses instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
