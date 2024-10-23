import 'package:core_app/core_app.dart';
import 'package:models_app/models_app.dart';

class DataCharactersList {
  final ICharacterRepository _characterRepository;
  const DataCharactersList(this._characterRepository);

  Future<void> likeTap({required int idCharacter, required bool liked}) async {
    await _characterRepository.toggleLike(
      idCharacter: idCharacter,
      liked: liked,
    );
  }

  Future<List<Character>> getAllData() async {
    return _characterRepository.getCharacters();
  }
}
