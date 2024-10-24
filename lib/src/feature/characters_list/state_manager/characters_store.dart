import 'dart:async';

import 'package:app_rickandmorty/src/feature/characters_list/data/character_to_mobx_mapper.dart';
import 'package:app_rickandmorty/src/feature/characters_list/data/data_characters_list.dart';
import 'package:app_rickandmorty/src/feature/characters_list/state_manager/character_model_mobx.dart';
import 'package:mobx/mobx.dart';

part 'characters_store.g.dart';

class CharactersStore = _CharactersStore with _$CharactersStore;

abstract class _CharactersStore with Store {
  final DataCharactersList dataCharactersList;
  final StreamSink sinkIDCharacter;

  _CharactersStore(this.dataCharactersList, this.sinkIDCharacter);

  @observable
  ObservableList<CharacterModelMobX> characters =
      ObservableList<CharacterModelMobX>();

  @observable
  bool isLoading = false;

  @action
  Future<void> fetchCharacters() async {
    isLoading = true;
    try {
      characters.clear();
      // ignore: inference_failure_on_instance_creation
      await Future.delayed(const Duration(seconds: 2));
      final result = await dataCharactersList.getAllData();
      final convert = CharacterToMobXMapper().mapper(result);
      characters.addAll(convert);
      isLoading = false;
    } catch (e) {
      isLoading = false;
    }
  }

  @action
  Future<void> toggleLike(int idCharacter, bool liked) async {
    await dataCharactersList.likeTap(idCharacter: idCharacter, liked: liked);
  }

  @action
  Future<void> openCard(
    int idCharacter,
  ) async {
    sinkIDCharacter.add(idCharacter);
  }
}
