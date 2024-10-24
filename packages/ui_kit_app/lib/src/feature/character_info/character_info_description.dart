import 'package:flutter/material.dart';
import 'package:models_app/models_app.dart';
import 'package:ui_kit_app/ui_kit_app.dart';

class CharacterInfoDescriptionList extends StatelessWidget {
  final List<DetailsData> dataList;
  const CharacterInfoDescriptionList({
    required this.dataList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: dataList
            .map(
              (element) => _buildInfoTile(
                context,
                element.icon as IconData,
                element.title,
                element.value,
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildInfoTile(
    BuildContext context,
    IconData icon,
    String title,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: context.color.irisBlue,
            child: Icon(icon, color: context.color.whiteApp),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: context.color.grey,
                  ),
                ),
                Text(value, style: const TextStyle(fontSize: 18)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
