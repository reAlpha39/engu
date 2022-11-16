import 'package:engu/core/infrastructure/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class QuizForEnglishTab extends StatelessWidget {
  const QuizForEnglishTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: CustomColor.secondaryBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: WebView(
        initialUrl: 'https://englishunires.com/',
        javascriptMode: JavascriptMode.unrestricted,
        gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{}..add(
            Factory<OneSequenceGestureRecognizer>(
              () => EagerGestureRecognizer(),
            ),
          ),
      ),
    );
  }
}
