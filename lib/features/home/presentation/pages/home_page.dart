import 'package:engu/core/infrastructure/constant.dart';
import 'package:engu/features/home/presentation/blocs/list_course/list_course_cubit.dart';
import 'package:engu/features/home/presentation/blocs/tab_bar/tab_bar_cubit.dart';
import 'package:engu/features/home/presentation/pages/courses_chapter_tab.dart';
import 'package:engu/features/home/presentation/pages/quiz_for_english_tab.dart';
import 'package:engu/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<TabBarCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt<ListCourseCubit>()..getCourses(),
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
          body: const _HomeLayout(),
        ),
      ),
    );
  }
}

class _HomeLayout extends StatelessWidget {
  const _HomeLayout();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: NestedScrollView(
          scrollDirection: Axis.vertical,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset('assets/images/banner_speak_english.png'),
              ),
            )
          ],
          body: BlocBuilder<TabBarCubit, TabBarState>(
            builder: (context, state) {
              return Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      GestureDetector(
                        onTap: () => context.read<TabBarCubit>().changeIndex(0),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: context.read<TabBarCubit>().currentIndex == 0
                                ? CustomColor.primaryColor
                                : CustomColor.secondaryBgColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: "Courses Chapter"
                              .text
                              .size(12)
                              .semiBold
                              .color(
                                  context.read<TabBarCubit>().currentIndex == 1
                                      ? CustomColor.primaryColor
                                      : Colors.white)
                              .makeCentered(),
                        ),
                      ).expand(),
                      const SizedBox(width: 16),
                      GestureDetector(
                        onTap: () => context.read<TabBarCubit>().changeIndex(1),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: context.read<TabBarCubit>().currentIndex == 1
                                ? CustomColor.primaryColor
                                : CustomColor.secondaryBgColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: "Quiz for English"
                              .text
                              .size(12)
                              .semiBold
                              .color(
                                  context.read<TabBarCubit>().currentIndex == 0
                                      ? CustomColor.primaryColor
                                      : Colors.white)
                              .makeCentered(),
                        ),
                      ).expand(),
                    ],
                  ).py16(),
                  Flexible(
                    fit: FlexFit.loose,
                    child: context.read<TabBarCubit>().currentIndex == 0
                        ? const CoursesChapterTab()
                        : const QuizForEnglishTab(),
                  ),
                ],
              );
            },
          ),
        ),
      ).centered().px16(),
    );
  }
}
