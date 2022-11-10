import 'package:dartz/dartz.dart';
import 'package:engu/core/infrastructure/failure.dart';
import 'package:engu/features/home/data/models/courses/courses.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Courses>>> getCourses();
}
