import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit_app/ui_kit_app.dart';

class CharacterImage extends StatelessWidget {
  final String? urlImage;
  const CharacterImage({
    required this.urlImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (urlImage == null) {
      return const Icon(Icons.error);
    }
    return CachedNetworkImage(
      imageUrl: urlImage!,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              context.color.whiteSmoke,
              BlendMode.colorBurn,
            ),
          ),
        ),
      ),
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
