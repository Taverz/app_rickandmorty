import 'package:flutter/material.dart';
import 'package:models_app/models_app.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ui_kit_app/src/feature/characters/character_image.dart';
import 'package:ui_kit_app/src/generated/assets.gen.dart';
import 'package:ui_kit_app/src/utils/debounce.dart';
import 'package:ui_kit_app/ui_kit_app.dart';

class CharacterInfo {
  static Widget view({
    required void Function(bool) onTapBack,
    required String urlImage,
    required List<DetailsData> listDataDescription,
    Key? key,
  }) =>
      _CharacterInfo(
        urlImage: urlImage,
        onTapBack: onTapBack,
        listDataDescription: listDataDescription,
        key: key,
      );

  static Widget load({
    required void Function() onTapBack,
    Key? key,
  }) =>
      _CharacterInfoLoading(
        onTapBack: onTapBack,
        key: key,
      );
}

class _CharacterInfo extends StatefulWidget {
  final String urlImage;
  final void Function(bool) onTapBack;
  final List<DetailsData> listDataDescription;
  const _CharacterInfo({
    required this.urlImage,
    required this.onTapBack,
    required this.listDataDescription,
    super.key,
  });

  @override
  State<_CharacterInfo> createState() => _CharacterInfoState();
}

class _CharacterInfoState extends State<_CharacterInfo>
    with SingleTickerProviderStateMixin {
  bool _changeBack = false;

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
    _debounced = Debounced(milliseconds: 500);
    _changeBack = !_changeBack;
  }

  @override
  void dispose() {
    _debounced.dispose();
    _controller.dispose();
    super.dispose();
  }

  void onTap() {
    _debounced.run(() {
      setState(() {
        _changeBack = !_changeBack;
        widget.onTapBack(_changeBack);
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
                  top: 10,
                  left: 20,
                  child: SafeArea(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(999),
                        color: context.color.whiteApp,
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(999),
                          onTap: onTap,
                          child: ScaleTransition(
                            scale: _scaleAnimation,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: _changeBack
                                  ? Assets.icons.arrowLeft.svg()
                                  : Assets.icons.arrowLeft.svg(),
                            ),
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
  final void Function() onTapBack;
  const _CharacterInfoLoading({
    required this.onTapBack,
    super.key,
  });

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
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade400,
                    highlightColor: Colors.grey.shade600,
                    child: ColoredBox(
                      color: context.color.grey,
                      child: const SizedBox(
                        height: 100,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 20,
                  child: SafeArea(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(999),
                        color: context.color.whiteApp,
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(999),
                          onTap: onTapBack,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Assets.icons.arrowLeft.svg(),
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
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade400,
              highlightColor: Colors.grey.shade600,
              child: const CharacterInfoDescriptionList(
                dataList: [
                  DetailsData(
                    status: null,
                    title: 'Text',
                    value: 'Text',
                  ),
                  DetailsData(
                    status: null,
                    title: 'Text',
                    value: 'Text',
                  ),
                  DetailsData(
                    status: null,
                    title: 'Text',
                    value: 'Text',
                  ),
                  DetailsData(
                    status: null,
                    title: 'Text',
                    value: 'Text',
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
