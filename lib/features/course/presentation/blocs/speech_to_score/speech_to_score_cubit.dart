import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

part 'speech_to_score_state.dart';
part 'speech_to_score_cubit.freezed.dart';

@injectable
class SpeechToScoreCubit extends Cubit<SpeechToScoreState> {
  SpeechToScoreCubit() : super(const SpeechToScoreState.initial());

  final SpeechToText _speech = SpeechToText();
  bool _speechEnabled = false;
  String speechRecogStatus = '';
  String speechResult = '';
  String speechScore = '0';
  bool _isDone = false;

  void initSpeechState() async {
    emit(const SpeechToScoreState.loading());

    _speechEnabled = await _speech.initialize(
      onStatus: (status) {
        speechRecogStatus = status;
        switch (status) {
          case 'listening':
            _isDone = false;
            emit(const SpeechToScoreState.listening());
            break;
          case 'done':
            if (!_isDone) {
              _isDone = true;
              emit(const SpeechToScoreState.done());
            }
            break;
          default:
        }
      },
    );
    emit(const SpeechToScoreState.initialized());
  }

  void startListening() async {
    try {
      if (_speechEnabled) {
        speechResult = '';
        emit(const SpeechToScoreState.listening());
        await _speech.listen(
          localeId: 'en_US',
          listenMode: ListenMode.dictation,
          listenFor: const Duration(seconds: 10),
          onResult: _onSpeechResult,
        );
      }
    } catch (e) {
      emit(SpeechToScoreState.error(e.toString()));
    }
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    emit(const SpeechToScoreState.listening());
    speechResult = result.recognizedWords;
    emit(const SpeechToScoreState.updateListenedWords());
  }

  void stopListening() async {
    if (_speechEnabled) {
      await _speech.stop();
    }
  }

  void scoreWords(String testWords) {
    final List<String> testWordsList = testWords.toLowerCase().split(' ');
    final List<String> speechWordsList = speechResult.toLowerCase().split(' ');
    int perWordScore = (100 / testWordsList.length).round();
    int score = 0;
    int shortestWordCount = testWordsList.length > speechWordsList.length
        ? speechWordsList.length
        : testWordsList.length;
    for (int i = 0; i < shortestWordCount; i++) {
      if (testWordsList[i] == speechWordsList[i]) {
        score += perWordScore;
      }
    }
    speechScore = score.toString();
  }
}
