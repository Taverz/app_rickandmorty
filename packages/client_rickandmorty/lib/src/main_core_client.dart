import 'package:client_rickandmorty/src/api_rick_and_morty.dart';
import 'package:client_rickandmorty/src/api_rick_and_morty_interface.dart';
import 'package:client_rickandmorty/src/utils/benchmark_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class MainCoreClient {
  IApiClient init() {
    final dio = Dio();
    dio.options = BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      contentType: 'application/json',
    );
    dio.interceptors.addAll([
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
      ),
      BenchmarkInterceptor(),
    ]);
    final dataApi = ApiClientRickEndMorty(dio: dio);

    return dataApi;
  }
}
