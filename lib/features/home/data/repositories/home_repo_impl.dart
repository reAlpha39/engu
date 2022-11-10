import 'package:engu/features/home/data/data_source/home_datasource.dart';
import 'package:engu/features/home/data/models/courses/courses.dart';
import 'package:engu/core/infrastructure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:engu/features/home/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl extends HomeRepo {
  final HomeDataSource _dataSource;

  HomeRepoImpl(this._dataSource);

  @override
  Future<Either<Failure, List<Courses>>> getCourses() async{
    try {
      final response = await _dataSource.getCourses();
      return Right(response);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
