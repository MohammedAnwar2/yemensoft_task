import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      // 'Accept-Language': 'en', 
      'Content-Type': 'application/json', 
    });
    super.onRequest(options, handler);
  }
}
