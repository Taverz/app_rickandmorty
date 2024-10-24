import 'package:core_app/core_app.dart';
import 'package:models_app/models_app.dart';

class DataCharacterInfo {
  final ICharacterRepository _characterRepository;
  const DataCharacterInfo(this._characterRepository);

  Future<CharacterInfoModel> getCharacterID({required int idCharacter}) async {
    return _characterRepository.fetchCharacterID(idCharacter);
  }
}
