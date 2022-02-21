import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://newsapi.org/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData(
      String path, Map<String, dynamic> query) async {
    return await dio.get(
      path,
      queryParameters: query,
    );
  }
}
