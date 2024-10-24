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

    test('fetch character by ID returns a single character', () async {
      const testCharacterId = 1;
      final characterInfo = CharacterInfoModel(
        id: 1,
        name: 'Rick Sanchez',
        status: 'Alive',
        species: 'Human',
        gender: 'Male',
        origin: Origin(name: 'Earth (C-137)', url: 'url'),
        location: Location(name: 'Citadel of Ricks', url: 'url'),
        image: 'image',
        episode: ['episode1', 'episode2'],
        url: 'url',
        created: DateTime.parse('2017-11-04T18:48:46.250Z'),
        type: '',
      );

      when(apiClient.fetchCharacterID(testCharacterId))
          .thenAnswer((_) async => characterInfo);

      final result = await apiClient.fetchCharacterID(testCharacterId);

      expect(result, isA<CharacterInfoModel>());
      expect(result.name, 'Rick Sanchez');
      expect(result.status, 'Alive');
      expect(result.species, 'Human');
      expect(result.origin.name, 'Earth (C-137)');
      expect(result.location.name, 'Citadel of Ricks');
    });

    test('fetch character by ID throws an exception on error', () async {
      const testCharacterId = 999;

      when(apiClient.fetchCharacterID(testCharacterId)).thenThrow(
        Exception('Character not found'),
      );

      expect(
        () async => apiClient.fetchCharacterID(testCharacterId),
        throwsA(isA<Exception>()),
      );
    });
  });
}
