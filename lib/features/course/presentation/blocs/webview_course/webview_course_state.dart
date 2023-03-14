part of 'webview_course_cubit.dart';

@freezed
class WebviewCourseState with _$WebviewCourseState {
  const factory WebviewCourseState.initial() = _Initial;
  const factory WebviewCourseState.loading() = _Loading;
  const factory WebviewCourseState.loaded() = _Loaded;
}
