import 'package:flutter/material.dart';
import 'package:ui_kit_app/src/common/refresh.dart';

class CharactersList extends StatelessWidget {
  final Future<void> Function() onRefreshList;
  final List<Widget> list;
  const CharactersList({
    required this.onRefreshList,
    required this.list,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshWidget(
      onRefresh: onRefreshList,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.70, 
          // crossAxisSpacing: 2, 
          // mainAxisSpacing: 2, 
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return SizedBox( width: double.infinity, child: list[index]);
        },
      ),
    );
  }
}
