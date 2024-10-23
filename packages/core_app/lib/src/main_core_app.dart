import 'package:client_rickandmorty/client_rickandmorty.dart';
import 'package:core_app/src/character/data/character_datasource.dart';
import 'package:core_app/src/character/domain/character_datasource_interface.dart';
import 'package:core_app/src/character/domain/character_repository_interface.dart';
import 'package:core_app/src/character/repository/character_repository.dart';
import 'package:core_app/src/common/crud_character_interface.dart';
import 'package:core_app/src/common/database_helper.dart';

class MainCoreApp {
  late ICharacterStorage _characterStorage;
  late IApiClient _apiClient;
  late ICharacterDataSource _characterDataSource;
  late ICharacterRepository characterRepository;

  Future<void> init() async {
    _characterStorage = SharedPreferencesHelper();
    _apiClient = MainCoreClient().init();
    _characterDataSource = CharacterDataSource(_apiClient, _characterStorage);
    characterRepository = CharacterRepository(_characterDataSource);
  }
}
