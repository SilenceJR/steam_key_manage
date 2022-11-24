import 'package:dio/dio.dart';

class Client {
  late Dio dio;

  init() {
    dio = Dio(BaseOptions(
        connectTimeout: 2000,
        receiveTimeout: 2000,
        sendTimeout: 2000,
        headers: {
          'Accept-Language': 'zh-CN,zh;q=0.9',
          'User-Agent':
              'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36'
        }));
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }
}
