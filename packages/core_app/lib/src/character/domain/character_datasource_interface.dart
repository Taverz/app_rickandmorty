import 'package:models_app/models_app.dart';

abstract class ICharacterDataSource {
  Future<List<Character>> fetchCharacters();
  Future<CharacterInfoModel> fetchCharacterID(int characterId);
  Future<List<Character>> fetchLikedCharacters();
  Future<void> removeCharacter(int characterId);
  Future<void> saveCharacter(Character character);
  Future<void> toggleLike(int id, bool liked);
}
