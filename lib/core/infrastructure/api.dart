import 'package:dio/dio.dart';
import 'package:engu/core/infrastructure/request_interceptor.dart';
import 'package:engu/injection.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Api {
  static Dio createDio() {
    String baseUrl = getIt.get(instanceName: 'baseUrl');
    var dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 5000,
        receiveTimeout: 3000,
        contentType: Headers.jsonContentType,
        followRedirects: true,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );

    dio.interceptors.addAll({
      RequestInterceptor(dio),
      PrettyDioLogger(),
    });

    return dio;
  }
}
