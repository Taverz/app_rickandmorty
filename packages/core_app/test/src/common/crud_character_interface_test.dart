import 'package:core_app/src/common/crud_character_interface.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:models_app/models_app.dart';
import 'package:test/test.dart';

import 'crud_character_interface_test.mocks.dart';

@GenerateMocks([ICharacterStorage])
void main() {
  late MockICharacterStorage characterStorage;

  setUp(() {
    characterStorage = MockICharacterStorage();
  });

  group('ICharacterStorage Tests', () {
    test('saveCharacter saves the character', () async {
      final character = Character(
        id: 431,
        name: 'Villain',
        status: 'status',
        species: 'species',
        gender: 'gender',
        image: 'image',
      );
      when(characterStorage.saveCharacter(character))
          .thenAnswer((_) async => {});
      await characterStorage.saveCharacter(character);
      verify(characterStorage.saveCharacter(character)).called(1);
    });

    test('updateCharacterList updates the list of characters', () async {
      final characters = [
        Character(
          id: 1,
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
        Character(
          id: -101,
          name: 'Simple',
          status: 'status',
          species: 'species',
          gender: 'gender',
          image: 'image',
        ),
        Character(
          id: 0,
          name: 'One',
          status: 'status',
          species: 'species',
          gender: 'gender',
          image: 'image',
        ),
      ];
      when(characterStorage.updateCharacterList(characters))
          .thenAnswer((_) async => {});
      await characterStorage.updateCharacterList(characters);
      verify(characterStorage.updateCharacterList(characters)).called(1);
    });

    test('updateCharacterLikedStatus updates the "liked" status', () async {
      const id = 1;
      const liked = true;
      when(characterStorage.updateCharacterLikedStatus(id, liked))
          .thenAnswer((_) async => {});
      await characterStorage.updateCharacterLikedStatus(id, liked);
      verify(characterStorage.updateCharacterLikedStatus(id, liked)).called(1);
    });

    test('getLocalCharacters returns a list of local characters', () async {
      final characters = [
        Character(
          id: 1,
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
      when(characterStorage.getLocalCharacters())
          .thenAnswer((_) async => characters);
      final result = await characterStorage.getLocalCharacters();
      expect(result, characters);
      verify(characterStorage.getLocalCharacters()).called(1);
    });

    test('removeCharacter removes a character', () async {
      const id = 1;
      when(characterStorage.removeCharacter(id)).thenAnswer((_) async => {});
      await characterStorage.removeCharacter(id);
      verify(characterStorage.removeCharacter(id)).called(1);
    });

    test('removeAllCharacter removes all characters', () async {
      when(characterStorage.removeAllCharacter()).thenAnswer((_) async => {});
      await characterStorage.removeAllCharacter();
      verify(characterStorage.removeAllCharacter()).called(1);
    });
  });
}
