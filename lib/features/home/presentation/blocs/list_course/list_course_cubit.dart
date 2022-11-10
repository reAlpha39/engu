import 'package:engu/features/home/data/models/courses/courses.dart';
import 'package:engu/features/home/domain/use_case/get_courses_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'list_course_state.dart';
part 'list_course_cubit.freezed.dart';

@injectable
class ListCourseCubit extends Cubit<ListCourseState> {
  ListCourseCubit(this._getCoursesUseCase)
      : super(const ListCourseState.initial());

  final GetCoursesUseCase _getCoursesUseCase;

  List<Courses>? listCourses;

  void getCourses() async {
    emit(const ListCourseState.loading());
    final result = await _getCoursesUseCase();
    result.fold(
      (l) => emit(ListCourseState.error(l.message)),
      (r) {
        listCourses = r;
        emit(const ListCourseState.loaded());
      },
    );
  }
}
