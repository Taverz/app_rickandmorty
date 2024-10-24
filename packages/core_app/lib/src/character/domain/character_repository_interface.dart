import 'package:models_app/models_app.dart';

abstract class ICharacterRepository {
  Future<List<Character>> getCharacters();
  Future<CharacterInfoModel> fetchCharacterID(int characterId);
  Future<void> toggleLike({
    required int idCharacter,
    required bool liked,
  });
  Future<List<Character>> getLikedCharacters();
}
