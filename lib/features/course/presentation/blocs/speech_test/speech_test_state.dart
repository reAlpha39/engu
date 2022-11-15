part of 'speech_test_cubit.dart';

@freezed
class SpeechTestState with _$SpeechTestState {
  const factory SpeechTestState.initial() = _Initial;
  const factory SpeechTestState.loading() = _Loading;
  const factory SpeechTestState.loaded() = _Loaded;
}
