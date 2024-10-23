import 'package:app_rickandmorty/src/common/dependence/global_data.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit_app/ui_kit_app.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CharactersBlocContent extends StatelessWidget {
  const CharactersBlocContent({super.key});

  @override
  Widget build(BuildContext context) {
    final store = 
    //ServiceLocatorApp.exemplar(context)
    GlobalData.charactersStore;
    store.fetchCharacters();
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
          // return const Center(
          //   child: CircularProgressIndicator(),
          // );
        }
        return CharactersList(
          onRefreshList: () async {},
          list: store.characters
              .map(
                (value) => CharacterCard.active(
                  liked: value.isLiked,
                  onTapLike: (liked) {
                    store.toggleLike(value.id, liked);
                  },
                  urlImage: value.urlImage,
                  textDescription: value.name,
                ),
              )
              .toList()
          ,
        );

      },
    );
  }
}
