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
    store.fetchCharacterInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          if (store.isLoading) {
            return CharacterInfo.load(
              onTapBack: () {
                // ignore: inference_failure_on_function_invocation
                Navigator.pop(context);
              },
            );
          }
          return CharacterInfo.view(
            onTapBack: (_) {
              // ignore: inference_failure_on_function_invocation
              // GlobalData.appRouter.pop();
              Navigator.pop(context);
            },
            urlImage: store.characterInfo!.imageUrl,
            listDataDescription: [
              DetailsData(
                status: null,
                title: 'Name',
                value: store.characterInfo!.type,
              ),
              DetailsData(
                status: Status.fromString(store.characterInfo!.status),
                title: 'Status',
                value: store.characterInfo!.status,
              ),
              DetailsData(
                status: Species.fromString(store.characterInfo!.species),
                title: 'Species',
                value: store.characterInfo!.species,
              ),
              DetailsData(
                status: Gender.fromString(store.characterInfo!.gender),
                title: 'Gender',
                value: store.characterInfo!.gender,
              ),
            ],
          );
        },
      ),
    );
  }
}
