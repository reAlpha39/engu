import 'package:engu/core/infrastructure/constant.dart';
import 'package:engu/core/infrastructure/theme.dart';
import 'package:engu/features/course/presentation/blocs/speech_to_score/speech_to_score_cubit.dart';
import 'package:engu/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/infrastructure/route.dart';

void main() {
  configureDependencies(baseApi);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SpeechToScoreCubit>()..initSpeechState(),
      child: MaterialApp.router(
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        title: 'Engu',
        theme: theme(),
      ),
    );
  }
}
