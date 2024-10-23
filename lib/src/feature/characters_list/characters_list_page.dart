import 'package:app_rickandmorty/src/feature/characters_list/widgets/characters_list.dart';
import 'package:flutter/material.dart';

class CharactersListPage extends StatelessWidget {
  const CharactersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CharactersBlocContent(),
      ),
    );
  }
}
