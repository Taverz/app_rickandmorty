import 'package:flutter/material.dart';

import 'demo_section.dart';

class DemoListView extends StatelessWidget {
  final List<DemoSection> items;

  const DemoListView({
    required this.items,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return items[index];
        },
      ),
    );
  }
}
