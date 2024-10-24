import 'package:app_rickandmorty/src/common/dependence/global_data.dart';
import 'package:app_rickandmorty/src/feature/characters_list/state_manager/characters_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ui_kit_app/ui_kit_app.dart';

class CharactersBlocContent extends StatefulWidget {
  const CharactersBlocContent({super.key});

  @override
  State<CharactersBlocContent> createState() => _CharactersBlocContentState();
}

class _CharactersBlocContentState extends State<CharactersBlocContent> {
  late CharactersStore store;
  @override
  void initState() {
    super.initState();
    store = GlobalData.charactersStore;
    store.fetchCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (store.isLoading) {
          return CharactersList(
            onRefreshList: store.fetchCharacters,
            list: [
              CharacterCard.load(),
              CharacterCard.load(),
              CharacterCard.load(),
              CharacterCard.load(),
              CharacterCard.load(),
            ],
          );
        }
        return CharactersList(
          onRefreshList: () async {},
          list: store.characters
              .map(
                (value) => GestureDetector(
                  onTap: () {
                    store.openCard(value.id);
                    // ignore: inference_failure_on_function_invocation
                    GlobalData.appRouter.pushNamed('/character_description');
                  },
                  child: CharacterCard.active(
                    liked: value.isLiked,
                    onTapLike: (liked) {
                      store.toggleLike(value.id, liked);
                    },
                    urlImage: value.urlImage,
                    textDescription: value.name,
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
