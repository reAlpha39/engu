part of 'list_course_cubit.dart';

@freezed
class ListCourseState with _$ListCourseState {
  const factory ListCourseState.initial() = _Initial;
  const factory ListCourseState.loading() = _Loading;
  const factory ListCourseState.error(String message) = _Error;
  const factory ListCourseState.loaded() = _Loaded;
}
