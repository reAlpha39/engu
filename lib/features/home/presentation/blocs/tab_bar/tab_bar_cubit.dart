import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'tab_bar_state.dart';
part 'tab_bar_cubit.freezed.dart';

@injectable
class TabBarCubit extends Cubit<TabBarState> {
  TabBarCubit() : super(const TabBarState.initial());

  int currentIndex = 0;

  void changeIndex(int index) {
    emit(const TabBarState.loading());
    currentIndex = index;
    emit(const TabBarState.loaded());
  }
}
