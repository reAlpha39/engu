import 'package:freezed_annotation/freezed_annotation.dart';

part 'courses.freezed.dart';
part 'courses.g.dart';

@freezed
class Courses with _$Courses {
  factory Courses({
    @Default (0) int id,
    @Default ("") String name,
    @Default("") String description,
    @Default("") String url,
    @JsonKey(name: 'test_speech') @Default("") String testSpeech,
  }) = _Courses;

  factory Courses.fromJson(Map<String, dynamic> json) =>
      _$CoursesFromJson(json);
}
