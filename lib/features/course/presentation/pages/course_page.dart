import 'package:engu/core/infrastructure/constant.dart';
import 'package:engu/features/home/data/models/courses/courses.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CoursePage extends StatelessWidget {
  final Courses data;
  const CoursePage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Engu'.text.color(CustomColor.primaryColor).make(),
      ),
      body: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: _CourseLayout(data),
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
    return NestedScrollView(
      scrollDirection: Axis.vertical,
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverToBoxAdapter(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset('assets/images/course_banner.png'),
          ),
        )
      ],
      body: Column(
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
                    .size(24)
                    .bold
                    .makeCentered(),
                const SizedBox(height: 4),
                data.description.text.white.makeCentered(),
              ],
            ).p12(),
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: WebView(
              initialUrl: data.url,
              javascriptMode: JavascriptMode.unrestricted,
            ),
          ).expand(),
          const SizedBox(height: 16),
        ],
      ),
    ).px16();
  }
}
