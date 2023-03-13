import 'package:engu/features/home/presentation/blocs/webview/webview_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:webview_flutter/webview_flutter.dart';

class QuizForEnglishTab extends StatelessWidget {
  const QuizForEnglishTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: WebView(
            initialUrl: 'https://englishunires.com/quiz-unires/',
            javascriptMode: JavascriptMode.unrestricted,
            onWebResourceError: (error) => ScaffoldMessenger(
              child: Text(error.description),
            ),
            onProgress: (progress) => context
                .read<WebviewCubit>()
                .updateProgress(progress.toDouble()),
            onWebViewCreated: (controller) =>
                context.read<WebviewCubit>().controller = controller,
            gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{}..add(
                Factory<OneSequenceGestureRecognizer>(
                  () => EagerGestureRecognizer(),
                ),
              ),
          ),
        ).pOnly(bottom: 16),
        BlocBuilder<WebviewCubit, WebviewState>(
          builder: (context, state) {
            return Visibility(
              visible: context.read<WebviewCubit>().webViewProgress != 100.0,
              child: Center(
                child: CircularProgressIndicator(
                  value: context.read<WebviewCubit>().webViewProgress / 100,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
