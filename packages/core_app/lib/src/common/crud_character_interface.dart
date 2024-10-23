import 'package:models_app/models_app.dart';

abstract class ICharacterStorage {
  Future<void> saveCharacter(Character character);
  Future<void> updateCharacterList(List<Character> characters);
  Future<void> updateCharacterLikedStatus(int id, bool liked);
  Future<List<Character>> getLocalCharacters();
  Future<void> removeCharacter(int id);
  Future<void> removeAllCharacter();
}
