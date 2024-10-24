import 'package:core_app/core_app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:models_app/models_app.dart';

import 'character_repository_interface_test.mocks.dart';

@GenerateMocks([ICharacterRepository])
void main() {
  late MockICharacterRepository characterRepository;

  setUp(() {
    characterRepository = MockICharacterRepository();
  });

  group('ICharacterRepository Tests', () {
    test('getCharacters returns a list of characters', () async {
      final characters = [
        Character(
          id: 1,
          name: 'Hero',
          status: 'Alive',
          species: 'Human',
          gender: 'Male',
          image: 'http://example.com/hero.jpg',
        ),
        Character(
          id: 2,
          name: 'Villain',
          status: 'Dead',
          species: 'Alien',
          gender: 'Female',
          image: 'http://example.com/villain.jpg',
        ),
      ];

      when(characterRepository.getCharacters())
          .thenAnswer((_) async => characters);
      final result = await characterRepository.getCharacters();
      expect(result, characters);
      verify(characterRepository.getCharacters()).called(1);
    });

    test('toggleLike changes the character\'s "liked" status', () async {
      const idCharacter = 1;
      const liked = true;
      when(
        characterRepository.toggleLike(
          idCharacter: idCharacter,
          liked: liked,
        ),
      ).thenAnswer((_) async => {});
      await characterRepository.toggleLike(
        idCharacter: idCharacter,
        liked: liked,
      );
      verify(
        characterRepository.toggleLike(
          idCharacter: idCharacter,
          liked: liked,
        ),
      ).called(1);
    });

    test('getLikedCharacters returns a list of liked characters', () async {
      final likedCharacters = [
        Character(
          id: 1,
          name: 'Hero',
          status: 'Alive',
          species: 'Human',
          gender: 'Male',
          image: 'http://example.com/hero.jpg',
          liked: true,
        ),
      ];

      when(characterRepository.getLikedCharacters())
          .thenAnswer((_) async => likedCharacters);

      final result = await characterRepository.getLikedCharacters();

      expect(result, likedCharacters);
      verify(characterRepository.getLikedCharacters()).called(1);
    });

    test('fetchCharacterID returns a single character by ID', () async {
      const testCharacterId = 1;
      final characterInfo = CharacterInfoModel(
        id: 1,
        name: 'Rick Sanchez',
        status: 'Alive',
        species: 'Human',
        gender: 'Male',
        origin: Origin(name: 'Earth (C-137)', url: 'url'),
        location: Location(name: 'Citadel of Ricks', url: 'url'),
        image: 'http://example.com/rick.jpg',
        episode: ['episode1', 'episode2'],
        url: 'url',
        created: DateTime.parse('2017-11-04T18:48:46.250Z'),
        type: '',
      );

      when(characterRepository.fetchCharacterID(testCharacterId))
          .thenAnswer((_) async => characterInfo);

      final result = await characterRepository.fetchCharacterID(
        testCharacterId,
      );

      expect(result, isA<CharacterInfoModel>());
      expect(result.name, 'Rick Sanchez');
      expect(result.status, 'Alive');
      expect(result.species, 'Human');
      expect(result.origin.name, 'Earth (C-137)');
      expect(result.location.name, 'Citadel of Ricks');
      verify(characterRepository.fetchCharacterID(testCharacterId)).called(1);
    });
  });
}
