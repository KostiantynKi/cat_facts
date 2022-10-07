import 'package:dio/dio.dart';

class RetroApi {
  Dio DioData() {
    final dio = Dio();
    dio.options.headers["Content-Type"] = "application/json";
    return dio;
  }
}
