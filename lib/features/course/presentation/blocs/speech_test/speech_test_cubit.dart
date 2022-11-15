import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'speech_test_state.dart';
part 'speech_test_cubit.freezed.dart';

@injectable
class SpeechTestCubit extends Cubit<SpeechTestState> {
  SpeechTestCubit() : super(const SpeechTestState.initial());

  void loadSpeechTest() {
    emit(const SpeechTestState.loading());
    emit(const SpeechTestState.loaded());
  }

  void unloadSpeechTest() {
    emit(const SpeechTestState.loading());
    emit(const SpeechTestState.initial());
  }
}
