import 'package:engu/features/home/presentation/blocs/list_course/list_course_cubit.dart';
import 'package:engu/features/home/presentation/widgets/card_courses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
