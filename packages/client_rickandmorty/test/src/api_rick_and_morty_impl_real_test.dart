import 'package:client_rickandmorty/client_rickandmorty.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:models_app/models_app.dart';

void main() {
  late IApiClient apiClient;

  setUp(() {
    apiClient = MainCoreClient().init();
  });

  group('Api client - character', () {
    test('fetch characters returns a list of characters', () async {
      final result = await apiClient.fetchCharacters();

      expect(result, isA<List<Character>>());
      expect(result.length, 20);
      expect(result[0].name, 'Rick Sanchez');
      expect(result[1].name, 'Morty Smith');
    });
  });
}
