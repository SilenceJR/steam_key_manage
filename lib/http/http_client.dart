import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

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

    var cookieJar = CookieJar();
    cookieJar.saveFromResponse(Uri(host: 'www.humblebundle.com'), [
      Cookie('_simpleauth_sess',
          'eyJ1c2VyX2lkIjo2MDU2Nzk2NzI3OTM0OTc2LCJpZCI6IlJjd0J6OW5mWjgiLCJyZWZlcnJlcl9jb2RlIjoiIiwiYXV0aF90aW1lIjoxNjY5MzU3NDMzfQ==|1669367772|52daf1ec131da2931cb469ceddc3db1d35be7a51'),
    ]);
    dio.interceptors.add(CookieManager(cookieJar));
  }
}
