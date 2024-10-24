import 'package:core_app/core_app.dart';
import 'package:flutter/material.dart';
import 'package:models_app/models_app.dart';
import 'package:ui_kit_app/ui_kit_app.dart';

void main() {
  runApp(
    AppInitDemo(
      envManager: EnvManager(),
    ),
  );
}

class AppInitDemo extends StatelessWidget {
  const AppInitDemo({
    required this.envManager,
    super.key,
  });
  final EnvManager envManager;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: envManager.stateStream,
      builder: (context, _) {
        final state = envManager.currentState;
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          behavior: HitTestBehavior.translucent,
          child: MaterialApp(
            themeMode: state.themeMode,
            locale: state.locale.get,
            theme: createWhiteTheme(),
            home: const HomeScreen(),
          ),
        );
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final listDescription = <DetailsData>[
      DetailsData(
        status: null,
        title: 'title1',
        value: 'value',
      ),
      DetailsData(
        status: null,
        title: 'Name',
        value: 'store.characterInfo!.type',
      ),
      DetailsData(
        status: Status.fromString('Alive'),
        title: 'Status',
        value: 'store.characterInfo!.status',
      ),
      DetailsData(
        status: Species.fromString('Human'),
        title: 'Species',
        value: 'store.characterInfo!.species',
      ),
      DetailsData(
        status: Gender.fromString('Female'),
        title: 'Gender',
        value: 'store.characterInfo!.gender',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo UI Kit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: DemoListView(
                items: [
                  DemoSection(
                    child: [
                      SizedBox(
                        height: 400,
                        child: CharacterInfoDescriptionList(
                          dataList: listDescription,
                        ),
                      ),
                      SizedBox(
                        height: 600,
                        child: CharacterInfo.view(
                          urlImage:
                              'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
                          listDataDescription: listDescription,
                          onTapBack: (_) {},
                        ),
                      ),
                    ],
                  ),
                  DemoSection(
                    child: [
                      CharacterCard.load(),
                      const SizedBox(height: 15),
                      CharacterCard.inactive(
                        urlImage: 'https://picsum.photos/200/300',
                        textDescription: 'Lorem Picsum',
                      ),
                      const SizedBox(height: 15),
                      CharacterCard.active(
                        liked: false,
                        onTapLike: (_) {},
                        urlImage:
                            'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
                        textDescription: 'Lorem Picsum',
                      ),
                    ],
                  ),
                  DemoSection(
                    child: [
                      SizedBox(
                        height: 400,
                        child: CharactersList(
                          onRefreshList: () async {},
                          list: [
                            CharacterCard.active(
                              liked: false,
                              onTapLike: (_) {},
                              urlImage:
                                  'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
                              textDescription: 'Lorem Picsum',
                            ),
                            CharacterCard.active(
                              liked: true,
                              onTapLike: (_) {},
                              urlImage:
                                  'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
                              textDescription: 'Lorem Picsum',
                            ),
                            CharacterCard.active(
                              liked: true,
                              onTapLike: (_) {},
                              urlImage:
                                  'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
                              textDescription: 'Lorem Picsum',
                            ),
                            CharacterCard.active(
                              liked: false,
                              onTapLike: (_) {},
                              urlImage:
                                  'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
                              textDescription: 'Lorem Picsum',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
