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

    test('toggleLike changes the characte\'rs "liked" status', () async {
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

    test('getLikedCharacters returns a list of liked characters',
        () async {
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
  });
}
