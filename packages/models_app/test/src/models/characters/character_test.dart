import 'package:flutter_test/flutter_test.dart';
import 'package:models_app/models_app.dart';

void main() {
  group('Character', () {
    final character = Character(
      id: 1,
      name: 'Hero',
      status: 'Alive',
      species: 'Human',
      gender: 'Male',
      image: 'http://example.com/hero.jpg',
      liked: true,
    );

    test('should create a Character instance', () {
      expect(character.id, 1);
      expect(character.name, 'Hero');
      expect(character.status, 'Alive');
      expect(character.species, 'Human');
      expect(character.gender, 'Male');
      expect(character.image, 'http://example.com/hero.jpg');
      expect(character.liked, true);
    });

    test('copyWith should create a new Character with modified values', () {
      final updatedCharacter = character.copyWith(
        name: 'Updated Hero',
        liked: false,
      );

      expect(updatedCharacter.id, character.id);
      expect(updatedCharacter.name, 'Updated Hero');
      expect(updatedCharacter.status, character.status);
      expect(updatedCharacter.species, character.species);
      expect(updatedCharacter.gender, character.gender);
      expect(updatedCharacter.image, character.image);
      expect(updatedCharacter.liked, false);
    });

    test('toMap should convert Character to Map', () {
      final characterMap = character.toMap();

      expect(characterMap, {
        'id': character.id,
        'name': character.name,
        'status': character.status,
        'species': character.species,
        'gender': character.gender,
        'image': character.image,
        'liked': character.liked,
      });
    });

    test('fromMap should create a Character from Map', () {
      final characterMap = {
        'id': 2,
        'name': 'Villain',
        'status': 'Dead',
        'species': 'Alien',
        'gender': 'Female',
        'image': 'http://example.com/villain.jpg',
        'liked': false,
      };

      final newCharacter = Character.fromMap(characterMap);

      expect(newCharacter.id, 2);
      expect(newCharacter.name, 'Villain');
      expect(newCharacter.status, 'Dead');
      expect(newCharacter.species, 'Alien');
      expect(newCharacter.gender, 'Female');
      expect(newCharacter.image, 'http://example.com/villain.jpg');
      expect(newCharacter.liked, false);
    });

    test('toJson should convert Character to JSON string', () {
      final jsonString = character.toJson();

      expect(jsonString,
          '{"id":1,"name":"Hero","status":"Alive","species":"Human","gender":"Male","image":"http://example.com/hero.jpg","liked":true}');
    });

    test('fromJson should create a Character from JSON string', () {
      const jsonString =
          '{"id":3,"name":"Sidekick","status":"Alive","species":"Human","gender":"Male","image":"http://example.com/sidekick.jpg","liked":true}';

      final newCharacter = Character.fromJson(jsonString);

      expect(newCharacter.id, 3);
      expect(newCharacter.name, 'Sidekick');
      expect(newCharacter.status, 'Alive');
      expect(newCharacter.species, 'Human');
      expect(newCharacter.gender, 'Male');
      expect(newCharacter.image, 'http://example.com/sidekick.jpg');
      expect(newCharacter.liked, true);
    });

    test('equality operator should work correctly', () {
      final anotherCharacter = Character(
        id: 1,
        name: 'Hero',
        status: 'Alive',
        species: 'Human',
        gender: 'Male',
        image: 'http://example.com/hero.jpg',
        liked: true,
      );

      expect(character, anotherCharacter);
    });

    test('hashCode should be consistent', () {
      final anotherCharacter = Character(
        id: 1,
        name: 'Hero',
        status: 'Alive',
        species: 'Human',
        gender: 'Male',
        image: 'http://example.com/hero.jpg',
        liked: true,
      );

      expect(character.hashCode, anotherCharacter.hashCode);
    });
  });
}
