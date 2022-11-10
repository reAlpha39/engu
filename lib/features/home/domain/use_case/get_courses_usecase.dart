import 'package:dartz/dartz.dart';
import 'package:engu/core/infrastructure/failure.dart';
import 'package:engu/features/home/data/models/courses/courses.dart';
import 'package:injectable/injectable.dart';

import '../repositories/home_repo.dart';

@injectable
class GetCoursesUseCase {
  final HomeRepo _repo;

  GetCoursesUseCase(this._repo);

  Future<Either<Failure, List<Courses>>> call() async {
    return await _repo.getCourses();
  }
}
