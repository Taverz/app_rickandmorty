import 'package:mobx/mobx.dart';

part 'character_model_mobx.g.dart';

class CharacterModelMobX = _CharacterModelMob with _$CharacterModelMobX;

abstract class _CharacterModelMob with Store {
  final int id;
  final String name;
  final String urlImage;

  @observable
  bool isLiked;

  _CharacterModelMob({
    required this.id,
    required this.name,
    required this.urlImage,
    this.isLiked = false,
  });
}
