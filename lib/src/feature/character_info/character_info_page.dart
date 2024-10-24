import 'package:app_rickandmorty/src/common/dependence/global_data.dart';
import 'package:app_rickandmorty/src/feature/character_info/state_manager/character_info_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:models_app/models_app.dart';
import 'package:ui_kit_app/ui_kit_app.dart';

class CharacterInfoPage extends StatefulWidget {
  const CharacterInfoPage({super.key});

  @override
  State<CharacterInfoPage> createState() => _CharacterInfoPageState();
}

class _CharacterInfoPageState extends State<CharacterInfoPage> {
  late CharacterInfoStore store;
  @override
  void initState() {
    super.initState();
    store = GlobalData.characterInfoStore;
    store.fetchCharacterInfo(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Observer(
          builder: (_) {
            if (store.isLoading) {
              return CharacterInfo.load();
            }
            return CharacterInfo.view(
              onTapBack: (_) {
                // ignore: inference_failure_on_function_invocation
                GlobalData.appRouter.pop();
              },
              urlImage: store.characterInfo!.imageUrl,
              listDataDescription: [
                DetailsData(
                  status: null,
                  title: 'Name',
                  value: store.characterInfo!.type,
                ),
                DetailsData(
                  status: Status.fromString('Alive'),
                  title: 'Status',
                  value: store.characterInfo!.status,
                ),
                DetailsData(
                  status: Species.fromString('Human'),
                  title: 'Species',
                  value: store.characterInfo!.species,
                ),
                DetailsData(
                  status: Gender.fromString('Female'),
                  title: 'Gender',
                  value: store.characterInfo!.gender,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
