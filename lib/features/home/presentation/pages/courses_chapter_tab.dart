import 'package:engu/core/infrastructure/constant.dart';
import 'package:engu/features/home/data/models/courses/courses.dart';
import 'package:engu/features/home/presentation/blocs/list_course/list_course_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

class CoursesChapterTab extends StatelessWidget {
  const CoursesChapterTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListCourseCubit, ListCourseState>(
      builder: (context, state) => state.maybeWhen(
        loading: () => const Center(child: CircularProgressIndicator()),
        loaded: () => ListView.builder(
          itemCount: context.read<ListCourseCubit>().listCourses!.length,
          itemBuilder: ((context, index) => CardCourse(
                data: context.read<ListCourseCubit>().listCourses![index],
              )),
        ),
        orElse: () => const SizedBox(),
      ),
    );
  }
}

class CardCourse extends StatelessWidget {
  final Courses data;
  const CardCourse({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColor.secondaryBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              data.name.text
                  .color(CustomColor.primaryColor)
                  .size(18)
                  .bold
                  .make(),
              const SizedBox(height: 4),
              data.description.text.white.make()
            ],
          ).expand(),
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              color: CustomColor.primaryColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.play_arrow,
              color: Colors.black,
              size: 30,
            ),
          )
        ],
      ).p16(),
    ).pOnly(bottom: 8);
  }
}
