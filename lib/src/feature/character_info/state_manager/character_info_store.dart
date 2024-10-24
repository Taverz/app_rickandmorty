import 'package:app_rickandmorty/src/feature/character_info/data/character_info.dart';
import 'package:mobx/mobx.dart';
import 'character_info_model.dart';

part 'character_info_store.g.dart';

class CharacterInfoStore = _CharacterInfoStore with _$CharacterInfoStore;

abstract class _CharacterInfoStore with Store {
  final DataCharacterInfo _dataCharacterInfo;

  _CharacterInfoStore(this._dataCharacterInfo);

  @observable
  CharacterInfoModel? characterInfo;

  @observable
  bool isLoading = false;

  @action
  Future<void> fetchCharacterInfo(int idCharacter) async {
    isLoading = true;
    final result =
        await _dataCharacterInfo.getCharacterID(idCharacter: idCharacter);
    characterInfo = CharacterInfoModel(
      id: result.id,
      imageUrl: result.image,
      status: result.status,
      species: result.species,
      type: result.type,
      gender: result.gender,
    );
    isLoading = false;
  }
}
