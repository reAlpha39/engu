import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'list_course_state.dart';
part 'list_course_cubit.freezed.dart';

@injectable
class ListCourseCubit extends Cubit<ListCourseState> {
  ListCourseCubit() : super(const ListCourseState.initial());
}
