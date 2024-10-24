import 'package:app_rickandmorty/src/feature/characters_list/state_manager/character_model_mobx.dart';
import 'package:models_app/models_app.dart';

class CharacterToMobXMapper {
  List<CharacterModelMobX> mapper(List<Character> result) {
    final convert = result
        .map(
          (Character element) => CharacterModelMobX(
            id: element.id,
            name: element.name,
            urlImage: element.image,
            isLiked: element.liked ?? false,
          ),
        )
        .toList();
        return convert;
  }
}
