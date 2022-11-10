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
              child: SafeArea(
                bottom: true,
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      'Record your Speech to test Pronunciation'
                          .text
                          .bold
                          .size(18)
                          .color(CustomColor.secondaryBgColor)
                          .make(),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.mic,
                        color: CustomColor.secondaryBgColor,
                        size: 24,
                      )
                    ],
                  ).box.make(),
                ).pOnly(top: 16, bottom: 8),
              ),
            )
          ],
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
