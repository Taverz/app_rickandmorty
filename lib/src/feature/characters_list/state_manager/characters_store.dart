import 'dart:async';

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
    characters.clear();
    final result = await dataCharactersList.getAllData();
    //TODO: move in mapper
    final convert = result
        .map(
          (element) => CharacterModelMobX(
            id: element.id,
            name: element.name,
            urlImage: element.image,
            isLiked: element.liked ?? false,
          ),
        )
        .toList();
    characters.addAll(convert);
    isLoading = false;
  }

  @action
  Future<void> toggleLike(int idCharacter, bool liked) async {
    await dataCharactersList.likeTap(idCharacter: idCharacter, liked: liked);
    final index = characters.indexWhere((char) => char.id == idCharacter);
    if (index != -1) {
      characters[index].isLiked = liked;
      characters[index] = characters[index];
    }
  }

  @action
  Future<void> openCard(
    int idCharacter,
  ) async {
    sinkIDCharacter.add(idCharacter);
  }
}
