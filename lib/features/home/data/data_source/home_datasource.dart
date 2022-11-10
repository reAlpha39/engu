import 'package:dio/dio.dart';
import 'package:engu/core/infrastructure/api.dart';
import 'package:engu/core/infrastructure/failure.dart';
import 'package:injectable/injectable.dart';

import '../models/courses/courses.dart';

abstract class HomeDataSource {
  Future<List<Courses>> getCourses();
}

@Injectable(as: HomeDataSource)
class HomeDataSourceImpl extends HomeDataSource {
  final dio = Api.createDio();

  @override
  Future<List<Courses>> getCourses() async {
    try {
      final response = await dio.get('/courses');
      if (response.statusCode == 200) {
        List rawData = response.data['data'];
        final data = rawData.map((e) => Courses.fromJson(e)).toList();
        return data;
      }
      else {
        throw Failure(response.data['message']);
      }
    } on DioError catch (e) {
      throw Failure(e.message);
    }
  }
}
