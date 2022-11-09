part of 'tab_bar_cubit.dart';

@freezed
class TabBarState with _$TabBarState {
  const factory TabBarState.initial() = _Initial;
  const factory TabBarState.loading() = _Loading;
  const factory TabBarState.loaded() = _Loaded;
}
