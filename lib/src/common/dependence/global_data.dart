import 'package:app_rickandmorty/src/common/router/app_router.dart';
import 'package:app_rickandmorty/src/feature/characters_list/data/data_characters_list.dart';
import 'package:app_rickandmorty/src/feature/characters_list/state_manager/characters_store.dart';
import 'package:core_app/core_app.dart';

class GlobalData {
  static late AppRouterCustom appRouter;
  static late DataCharactersList _dataCharactersList;
  static late CharactersStore charactersStore;
  Future<void> init() async {
    appRouter = AppRouterCustom();

    final mainCoreApp = MainCoreApp();
    await mainCoreApp.init();

    /// Character
    final characterRepository = mainCoreApp.characterRepository;
    _dataCharactersList = DataCharactersList(characterRepository);
    charactersStore = CharactersStore(_dataCharactersList);
  }
}
