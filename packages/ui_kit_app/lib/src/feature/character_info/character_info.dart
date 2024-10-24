import 'package:flutter/material.dart';
import 'package:models_app/models_app.dart';
import 'package:ui_kit_app/src/feature/characters/character_image.dart';
import 'package:ui_kit_app/src/generated/assets.gen.dart';
import 'package:ui_kit_app/src/utils/debounce.dart';
import 'package:ui_kit_app/ui_kit_app.dart';

class CharacterInfo {
  static Widget view({
    required void Function(bool) onTapLike,
    required String urlImage,
    required bool liked,
    required List<DetailsData> listDataDescription,
    Key? key,
  }) =>
      _CharacterInfo(
        urlImage: urlImage,
        onTapLike: onTapLike,
        liked: liked,
        listDataDescription: listDataDescription,
        key: key,
      );

  static Widget load({
    required List<DetailsData> listDataDescription,
    Key? key,
  }) =>
      _CharacterInfoLoading(
        listDataDescription: listDataDescription,
        key: key,
      );
}

class _CharacterInfo extends StatefulWidget {
  final String urlImage;
  final bool liked;
  final void Function(bool) onTapLike;
  final List<DetailsData> listDataDescription;
  const _CharacterInfo({
    required this.urlImage,
    required this.liked,
    required this.onTapLike,
    required this.listDataDescription,
    super.key,
  });

  @override
  State<_CharacterInfo> createState() => _CharacterInfoState();
}

class _CharacterInfoState extends State<_CharacterInfo>
    with SingleTickerProviderStateMixin {
  bool _like = false;

  late final Debounced _debounced;

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1, end: 1.8).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _debounced = Debounced(milliseconds: 200);
    _like = widget.liked;
  }

  @override
  void dispose() {
    _debounced.dispose();
    _controller.dispose();
    super.dispose();
  }

  void onTapLike() {
    _debounced.run(() {
      setState(() {
        _like = !_like;
        widget.onTapLike(_like);
      });
      _controller.forward().then((_) {
        _controller.reverse();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 10,
          child: SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                Positioned.fill(
                  child: CharacterImage(urlImage: widget.urlImage),
                ),
                Positioned(
                  top: 15,
                  left: 15,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(999),
                      color: context.color.whiteApp,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(999),
                        onTap: onTapLike,
                        child: ScaleTransition(
                          scale: _scaleAnimation,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: _like
                                ? Assets.icons.arrowLeft.svg()
                                : Assets.icons.arrowLeft.svg(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 12,
          child: SizedBox(
            width: double.infinity,
            child: CharacterInfoDescriptionList(
              dataList: widget.listDataDescription,
            ),
          ),
        ),
      ],
    );
  }
}

class _CharacterInfoLoading extends StatelessWidget {
  final List<DetailsData> listDataDescription;
  const _CharacterInfoLoading({
    required this.listDataDescription,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: ColoredBox(
            color: context.color.grey,
            child: const SizedBox(
              height: 200,
              width: double.infinity,
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: CharacterInfoDescriptionList(
              dataList: listDataDescription,
            ),
          ),
        ),
      ],
    );
  }
}
