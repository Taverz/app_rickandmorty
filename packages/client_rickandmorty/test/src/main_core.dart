import 'package:client_rickandmorty/client_rickandmorty.dart';
import 'package:client_rickandmorty/src/api_rick_and_morty.dart';
import 'package:client_rickandmorty/src/utils/benchmark_interceptor.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@GenerateMocks([IApiClient])
void main() {
  group('MainCoreClient Tests', () {
    test('init returns a valid IApiClient instance', () {
      final mainCoreClient = MainCoreClient();

      final apiClient = mainCoreClient.init();

      expect(apiClient, isA<IApiClient>());
    });

    test('init initializes Dio with the correct settings', () {
      final mainCoreClient = MainCoreClient();
      final apiClient = mainCoreClient.init() as ApiClientRickEndMorty;

      expect(apiClient.dio.options.connectTimeout, const Duration(seconds: 30));
      expect(apiClient.dio.options.receiveTimeout, const Duration(seconds: 30));
      expect(apiClient.dio.options.contentType, 'application/json');
    });

    test('init adds the necessary interceptors', () {
      final mainCoreClient = MainCoreClient();
      final apiClient = mainCoreClient.init() as ApiClientRickEndMorty;

      expect(apiClient.dio.interceptors.length, 2);
      expect(apiClient.dio.interceptors[0], isA<PrettyDioLogger>());
      expect(apiClient.dio.interceptors[1], isA<BenchmarkInterceptor>());
    });
  });
}
