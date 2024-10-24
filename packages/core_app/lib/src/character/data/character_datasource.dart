import 'package:client_rickandmorty/client_rickandmorty.dart';
import 'package:core_app/src/character/domain/character_datasource_interface.dart';
import 'package:core_app/src/common/crud_character_interface.dart';
import 'package:models_app/models_app.dart';

class CharacterDataSource implements ICharacterDataSource {
  final IApiClient _apiService;
  final ICharacterStorage _databaseHelper;

  CharacterDataSource(this._apiService, this._databaseHelper);
  @override
  Future<List<Character>> fetchCharacters() async {
    final charactersApi = await _apiService.fetchCharacters();

    if (charactersApi.isEmpty) {
      return _databaseHelper.getLocalCharacters();
    } else {
      await _databaseHelper.updateCharacterList(charactersApi);
      return _databaseHelper.getLocalCharacters();
    }
  }

  @override
  Future<CharacterInfoModel> fetchCharacterID(int characterId) async {
    return _apiService.fetchCharacterID(characterId);
  }

  @override
  Future<List<Character>> fetchLikedCharacters() async {
    return _databaseHelper.getLocalCharacters();
  }

  @override
  Future<void> removeCharacter(int characterId) async {
    await _databaseHelper.removeCharacter(characterId);
  }
  

  @override
  Future<void> saveCharacter(Character character) async {
    await _databaseHelper.saveCharacter(character);
  }

  @override
  Future<void> toggleLike(int id, bool liked) async {
    await _databaseHelper.updateCharacterLikedStatus(id, liked);
  }
}
