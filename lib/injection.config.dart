// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'features/course/presentation/blocs/speech_test/speech_test_cubit.dart'
    as _i6;
import 'features/course/presentation/blocs/speech_to_score/speech_to_score_cubit.dart'
    as _i7;
import 'features/home/data/data_source/home_datasource.dart' as _i3;
import 'features/home/data/repositories/home_repo_impl.dart' as _i5;
import 'features/home/domain/repositories/home_repo.dart' as _i4;
import 'features/home/domain/use_case/get_courses_usecase.dart' as _i9;
import 'features/home/presentation/blocs/list_course/list_course_cubit.dart'
    as _i10;
import 'features/home/presentation/blocs/tab_bar/tab_bar_cubit.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.HomeDataSource>(() => _i3.HomeDataSourceImpl());
  gh.factory<_i4.HomeRepo>(() => _i5.HomeRepoImpl(get<_i3.HomeDataSource>()));
  gh.factory<_i6.SpeechTestCubit>(() => _i6.SpeechTestCubit());
  gh.factory<_i7.SpeechToScoreCubit>(() => _i7.SpeechToScoreCubit());
  gh.factory<_i8.TabBarCubit>(() => _i8.TabBarCubit());
  gh.factory<_i9.GetCoursesUseCase>(
      () => _i9.GetCoursesUseCase(get<_i4.HomeRepo>()));
  gh.factory<_i10.ListCourseCubit>(
      () => _i10.ListCourseCubit(get<_i9.GetCoursesUseCase>()));
  return get;
}
