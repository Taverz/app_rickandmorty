import 'package:dio/dio.dart';

// ignore: public_member_api_docs
class BenchmarkInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // ignore: avoid_print
    print('Request [${options.method}] ${options.uri} started');
    options.extra['startTime'] = DateTime.now().millisecondsSinceEpoch;
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final startTime = response.requestOptions.extra['startTime'] as int;
    final endTime = DateTime.now().millisecondsSinceEpoch;
    final duration = endTime - startTime;
    // ignore: avoid_print
    print('Request to ${response.requestOptions.uri} took $duration ms');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    final startTime = err.requestOptions.extra['startTime'] as int;
    final endTime = DateTime.now().millisecondsSinceEpoch;
    final duration = endTime - startTime;
    // ignore: avoid_print
    print('Error on request to ${err.requestOptions.uri} took $duration ms');
    super.onError(err, handler);
  }
}
