import 'package:engu/core/infrastructure/constant.dart';
import 'package:engu/features/course/presentation/blocs/speech_test/speech_test_cubit.dart';
import 'package:engu/features/course/presentation/blocs/speech_to_score/speech_to_score_cubit.dart';
import 'package:engu/features/course/presentation/widgets/speech_score_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

class SpeechTestBottomBar extends StatelessWidget {
  final String speechTest;
  const SpeechTestBottomBar({super.key, required this.speechTest});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: GestureDetector(
        onTap: () {
          context.read<SpeechTestCubit>().state.maybeWhen(
                initial: () => context.read<SpeechTestCubit>().loadSpeechTest(),
                loaded: () =>
                    context.read<SpeechToScoreCubit>().speechRecogStatus ==
                            'listening'
                        ? context.read<SpeechToScoreCubit>().stopListening()
                        : null,
                orElse: () => null,
              );
        },
        child: Row(
          children: [
            const SizedBox(width: 24),
            BlocConsumer<SpeechToScoreCubit, SpeechToScoreState>(
              listener: (context, state) => state.maybeWhen(
                done: ([bool mounted = true]) async {
                  context.read<SpeechToScoreCubit>().scoreWords(speechTest);
                  var closeDialog = await showGeneralDialog(
                      context: context,
                      pageBuilder: (context, _, __) {
                        return const SpeechScoreResult();
                      });
                  if (!mounted) return;
                  if (closeDialog == null) {
                    context.read<SpeechTestCubit>().unloadSpeechTest();
                  }
                  return;
                },
                orElse: () => null,
              ),
              builder: (context, state) => state.maybeWhen(
                loading: () => Center(child: '...'.text.white.make()),
                error: (message) => Center(child: message.text.white.make()),
                orElse: () => BlocConsumer<SpeechTestCubit, SpeechTestState>(
                  listener: (context, state) => state.maybeWhen(
                    loaded: () =>
                        context.read<SpeechToScoreCubit>().startListening(),
                    orElse: () => null,
                  ),
                  builder: (context, state) => state.maybeWhen(
                    initial: () => 'Record your Speech to test Pronunciation'
                        .text
                        .bold
                        .size(12)
                        .color(CustomColor.secondaryBgColor)
                        .makeCentered()
                        .px16(),
                    loaded: () => Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        'Baca Kalimat Berikut:'.text.size(12).white.make(),
                        const SizedBox(height: 4),
                        speechTest.text.bold.size(14).white.make(),
                        const SizedBox(height: 4),
                        'kata-kata yang dimasukkan:'
                            .text
                            .size(12)
                            .color(const Color(0xFFFFC006))
                            .make(),
                        context
                            .read<SpeechToScoreCubit>()
                            .speechResult
                            .text
                            .bold
                            .size(14)
                            .white
                            .make(),
                      ],
                    ).box.make().px16(),
                    orElse: () => const SizedBox(),
                  ),
                ),
              ),
            ).expand(),
            BlocBuilder<SpeechToScoreCubit, SpeechToScoreState>(
              builder: (context, state) => Icon(
                context.read<SpeechToScoreCubit>().speechRecogStatus ==
                        'listening'
                    ? Icons.mic_off
                    : Icons.mic,
                color: Colors.white,
                size: 22,
              ),
            ),
          ],
        ).p16().box.make(),
      ),
    );
  }
}
