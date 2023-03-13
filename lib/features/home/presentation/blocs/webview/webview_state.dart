part of 'webview_cubit.dart';

@freezed
class WebviewState with _$WebviewState {
  const factory WebviewState.initial() = _Initial;
  const factory WebviewState.loading() = _Loading;
  const factory WebviewState.loaded() = _Loaded;
  const factory WebviewState.error(String message) = _Error;
}
