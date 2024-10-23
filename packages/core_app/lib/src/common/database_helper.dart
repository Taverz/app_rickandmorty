import 'package:core_app/src/common/crud_character_interface.dart';
import 'package:models_app/models_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper implements ICharacterStorage {
  final String _addressDB = 'liked_characters';

  @override
  Future<void> saveCharacter(Character character) async {
    final preferences = await SharedPreferences.getInstance();
    final likedCharacters = preferences.getStringList(_addressDB) ?? [];

    if (!likedCharacters.any(
      (element) => Character.fromJson(element).id == character.id,
    )) {
      likedCharacters.add(character.toJson());
    }

    await preferences.setStringList(_addressDB, likedCharacters);
  }

  @override
  Future<List<Character>> getLocalCharacters() async {
    final preferences = await SharedPreferences.getInstance();
    final likedCharacters = preferences.getStringList(_addressDB) ?? [];
    final convert = likedCharacters.map((item) {
      return Character.fromJson(item);
    }).toList();
    return convert;
  }

  @override
  Future<void> removeCharacter(int id) async {
    final preferences = await SharedPreferences.getInstance();
    final likedCharacters = preferences.getStringList(_addressDB) ?? [];

    likedCharacters
        .removeWhere((element) => Character.fromJson(element).id == id);

    await preferences.setStringList(_addressDB, likedCharacters);
  }

  @override
  Future<void> removeAllCharacter() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove(_addressDB);
  }

  @override
  Future<void> updateCharacterList(List<Character> characters) async {
    final preferences = await SharedPreferences.getInstance();
    final likedCharacters = preferences.getStringList(_addressDB) ?? [];

    final newCharacterIds = characters.map((character) => character.id).toSet();

    likedCharacters.removeWhere((element) {
      final character = Character.fromJson(element);
      return !newCharacterIds.contains(character.id);
    });

    for (final character in characters) {
      final findElement = likedCharacters.any(
        (element) => Character.fromJson(element).id == character.id,
      );
      if (!findElement) {
        likedCharacters.add(character.toJson());
      }
    }

    await preferences.setStringList(_addressDB, likedCharacters);
  }

  @override
  Future<void> updateCharacterLikedStatus(int id, bool liked) async {
    final preferences = await SharedPreferences.getInstance();
    final likedCharacters = preferences.getStringList(_addressDB) ?? [];

    final index = likedCharacters.indexWhere(
      (element) => Character.fromJson(element).id == id,
    );

    if (index != -1) {
      final character = Character.fromJson(likedCharacters[index]);
      character.liked = liked;
      likedCharacters[index] = character.toJson();
      await preferences.setStringList(_addressDB, likedCharacters);
    }else{
      throw Exception('No found Character from update, liked');
    }
  }
}
