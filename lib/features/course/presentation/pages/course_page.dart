import 'package:engu/core/infrastructure/constant.dart';
import 'package:engu/features/course/presentation/blocs/speech_test/speech_test_cubit.dart';
import 'package:engu/features/course/presentation/widgets/speech_test_bottom_bar.dart';
import 'package:engu/features/home/data/models/courses/courses.dart';
import 'package:engu/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../blocs/webview_course/webview_course_cubit.dart';

class CoursePage extends StatelessWidget {
  final Courses data;
  const CoursePage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<SpeechTestCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<WebviewCourseCubit>(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: 'Engu Aplication'
              .text
              .color(CustomColor.primaryColor)
              .size(14)
              .bold
              .make(),
        ),
        body: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: _CourseLayout(data),
              ).expand(),
              Container(
                decoration: const BoxDecoration(
                  color: CustomColor.primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: SpeechTestBottomBar(
                  speechTest: data.testSpeech,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _CourseLayout extends StatelessWidget {
  final Courses data;
  const _CourseLayout(this.data);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: CustomColor.secondaryBgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              data.name.text
                  .color(CustomColor.primaryColor)
                  .size(14)
                  .bold
                  .makeCentered(),
              const SizedBox(height: 4),
              data.description.text.size(12).black.makeCentered(),
            ],
          ).p12(),
        ),
        const SizedBox(height: 16),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              WebView(
                initialUrl: data.url,
                javascriptMode: JavascriptMode.unrestricted,
                backgroundColor: Colors.white,
                onWebResourceError: (error) => ScaffoldMessenger(
                  child: Text(error.description),
                ),
                onProgress: (progress) => context
                    .read<WebviewCourseCubit>()
                    .updateProgress(progress.toDouble()),
                onWebViewCreated: (controller) =>
                    context.read<WebviewCourseCubit>().controller = controller,
              ),
              BlocBuilder<WebviewCourseCubit, WebviewCourseState>(
                builder: (context, state) {
                  return Visibility(
                    visible:
                        context.read<WebviewCourseCubit>().webViewProgress !=
                            100.0,
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: CircularProgressIndicator(
                          value: context
                                  .read<WebviewCourseCubit>()
                                  .webViewProgress /
                              100,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ).expand(),
        const SizedBox(height: 16),
      ],
    ).px16();
  }
}
