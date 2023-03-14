import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:webview_flutter/webview_flutter.dart';

part 'webview_course_state.dart';
part 'webview_course_cubit.freezed.dart';

@injectable
class WebviewCourseCubit extends Cubit<WebviewCourseState> {
  WebviewCourseCubit() : super(const WebviewCourseState.initial());

  WebViewController? controller;
  double webViewProgress = 0;

  void updateProgress(double progress) {
    emit(const WebviewCourseState.loading());
    webViewProgress = progress;
    emit(const WebviewCourseState.loaded());
  }
}
