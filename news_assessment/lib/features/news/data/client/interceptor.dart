import 'package:dio/dio.dart';

class NewsInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (!options.queryParameters.containsKey('apiKey')) {
      options.queryParameters['apiKey'] = '8aa8f4f91bb5414cbe669cd59f08092a';
    }
    return super.onRequest(options, handler);
  }
}
