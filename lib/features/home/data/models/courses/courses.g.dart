// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Courses _$$_CoursesFromJson(Map<String, dynamic> json) => _$_Courses(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? "",
      description: json['description'] as String? ?? "",
      url: json['url'] as String? ?? "",
      testSpeech: json['test_speech'] as String? ?? "",
    );

Map<String, dynamic> _$$_CoursesToJson(_$_Courses instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'url': instance.url,
      'test_speech': instance.testSpeech,
    };
