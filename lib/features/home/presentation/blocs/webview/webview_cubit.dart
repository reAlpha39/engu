import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:webview_flutter/webview_flutter.dart';

part 'webview_state.dart';
part 'webview_cubit.freezed.dart';

@injectable
class WebviewCubit extends Cubit<WebviewState> {
  WebviewCubit() : super(const WebviewState.initial());

  WebViewController? controller;
  double webViewProgress = 0;

  void updateProgress(double progress) {
    emit(const WebviewState.loading());
    webViewProgress = progress;
    emit(const WebviewState.loaded());
  }
}
