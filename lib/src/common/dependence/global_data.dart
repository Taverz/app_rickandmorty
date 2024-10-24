import 'package:app_rickandmorty/src/common/router/app_router.dart';
import 'package:app_rickandmorty/src/feature/character_info/data/character_info.dart';
import 'package:app_rickandmorty/src/feature/character_info/state_manager/character_info_store.dart';
import 'package:app_rickandmorty/src/feature/characters_list/data/data_characters_list.dart';
import 'package:app_rickandmorty/src/feature/characters_list/state_manager/characters_store.dart';
import 'package:core_app/core_app.dart';

class GlobalData {
  static late AppRouterCustom appRouter;
  static late DataCharactersList _dataCharactersList;
  static late CharactersStore charactersStore;
  static late CharacterInfoStore characterInfoStore;
  Future<void> init() async {
    appRouter = AppRouterCustom();

    final mainCoreApp = MainCoreApp();
    await mainCoreApp.init();

    /// Characters
    final characterRepository = mainCoreApp.characterRepository;
    _dataCharactersList = DataCharactersList(characterRepository);
    charactersStore = CharactersStore(_dataCharactersList);
    /// Character Info
    final dataInfo = DataCharacterInfo(characterRepository);
    characterInfoStore = CharacterInfoStore(dataInfo);
  }
}
