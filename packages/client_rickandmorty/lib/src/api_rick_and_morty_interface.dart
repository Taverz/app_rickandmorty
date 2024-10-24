import 'package:models_app/models_app.dart';

abstract class IApiClient {
  Future<List<Character>> fetchCharacters();
  Future<CharacterInfoModel> fetchCharacterID(int idCharacter);
}
