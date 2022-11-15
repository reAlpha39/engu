import 'package:engu/core/infrastructure/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import '../blocs/speech_to_score/speech_to_score_cubit.dart';

class SpeechScoreResult extends StatelessWidget {
  const SpeechScoreResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          height: 200,
          width: 300,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              'Accuracy Score'.text.black.size(14).bold.make(),
              const SizedBox(height: 14),
              ('${context.read<SpeechToScoreCubit>().speechScore}%')
                  .text
                  .color(CustomColor.primaryColor)
                  .size(42)
                  .bold
                  .make(),
              const SizedBox(height: 14),
              ElevatedButton(
                onPressed: () => context.pop(),
                child: 'Close'.text.make().px12(),
              ),
            ],
          ).py24(),
        ),
      ),
    );
  }
}
