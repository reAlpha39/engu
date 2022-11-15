part of 'speech_to_score_cubit.dart';

@freezed
class SpeechToScoreState with _$SpeechToScoreState {
  const factory SpeechToScoreState.initial() = _Initial;
  const factory SpeechToScoreState.loading() = _Loading;
  const factory SpeechToScoreState.error(String message) = _Error;
  const factory SpeechToScoreState.initialized() = _Initialized;
  const factory SpeechToScoreState.listening() = _Listening;
  const factory SpeechToScoreState.updateListenedWords() = _UpdateListenedWords;
  const factory SpeechToScoreState.done() = _Done;
}
