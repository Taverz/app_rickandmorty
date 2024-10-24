import 'package:core_app/src/character/domain/character_datasource_interface.dart';
import 'package:core_app/src/character/domain/character_repository_interface.dart';
import 'package:models_app/models_app.dart';

class CharacterRepository implements ICharacterRepository {
  final ICharacterDataSource dataSource;

  CharacterRepository(this.dataSource);

  @override
  Future<List<Character>> getCharacters() async {
    return dataSource.fetchCharacters();
  }

  @override
  Future<CharacterInfoModel> fetchCharacterID(int characterId) async {
    return dataSource.fetchCharacterID(characterId);
  }

  @override
  Future<void> toggleLike({
    required int idCharacter,
    required bool liked,
  }) async {
    await dataSource.toggleLike(idCharacter, liked);
  }

  @override
  Future<List<Character>> getLikedCharacters() async {
    return dataSource.fetchLikedCharacters();
  }
}
