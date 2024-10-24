import 'package:client_rickandmorty/client_rickandmorty.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:models_app/models_app.dart';

import 'api_rick_and_morty_interface_test.mocks.dart';

@GenerateMocks([IApiClient])
void main() {
  late MockIApiClient apiClient;

  setUp(() {
    apiClient = MockIApiClient();
  });

  group('Api client - character', () {
    test('fetch characters returns a list of characters', () async {

      final characters = [
        Character(
          id: 923,
          name: 'Hero',
          status: 'status',
          species: 'species',
          gender: 'gender',
          image: 'image',
        ),
        Character(
          id: 431,
          name: 'Villain',
          status: 'status',
          species: 'species',
          gender: 'gender',
          image: 'image',
        ),
      ];

      when(apiClient.fetchCharacters()).thenAnswer((_) async => characters);

      final result = await apiClient.fetchCharacters();

      expect(result, isA<List<Character>>());
      expect(result.length, 2);
      expect(result[0].name, 'Hero');
      expect(result[1].name, 'Villain');
    });

    test('fetch characters throws an exception on error', () async {
      when(apiClient.fetchCharacters()).thenThrow(
        Exception('Network exception'),
      );

      expect(
        () async => apiClient.fetchCharacters(),
        throwsA(isA<Exception>()),
      );
    });
  });
}
