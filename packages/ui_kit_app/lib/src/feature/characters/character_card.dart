import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ui_kit_app/src/feature/characters/character_image.dart';
import 'package:ui_kit_app/src/generated/assets.gen.dart';
import 'package:ui_kit_app/src/utils/debounce.dart';
import 'package:ui_kit_app/ui_kit_app.dart';

class CharacterCard {
  static Widget active({
    required void Function(bool) onTapLike,
    required String urlImage,
    required String textDescription,
    required bool liked,
    Key? key,
  }) =>
      _CharacterCard(
        urlImage: urlImage,
        textDescription: textDescription,
        onTapLike: onTapLike,
        liked: liked,
        key: key ?? UniqueKey(),
      );
  static Widget inactive({
    required String urlImage,
    required String textDescription,
    Key? key,
  }) =>
      _CharacterCard(
        urlImage: urlImage,
        textDescription: textDescription,
        onTapLike: (_) {},
        active: false,
        key: key,
      );

  static Widget load({
    Key? key,
  }) =>
      _CharacterCardLoading(
        key: key,
      );
}

class _CharacterCard extends StatefulWidget {
  final String urlImage;
  final bool active;
  final bool liked;
  final String textDescription;
  final void Function(bool) onTapLike;
  const _CharacterCard({
    required this.urlImage,
    required this.textDescription,
    required this.onTapLike,
    this.active = true,
    this.liked = false,
    super.key,
  });

  @override
  State<_CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends State<_CharacterCard>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  bool _like = false;

  /// Так как это элемент списка с состоянием нам нужно сохранить при прокрутке списка это состояние
  @override
  bool get wantKeepAlive => true;

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
    _debounced = Debounced(milliseconds: 120);
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
    super.build(context);
    return BuildContent(
      childImageWidget: Stack(
        children: [
          Positioned.fill(
            child: CharacterImage(
              urlImage: widget.urlImage,
            ),
          ),
          if (widget.active)
            Positioned(
              top: 10,
              right: 10,
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
                            ? Assets.icons.likeLiked.svg()
                            : Assets.icons.likeUnLiked.svg(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
      childTextWidget: Text(
        widget.textDescription,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: context.text.bodyBold.copyWith(color: Colors.black),
      ),
    );
  }
}

class _CharacterCardLoading extends StatelessWidget {
  const _CharacterCardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildContent(
      shimmerView: true,
      childImageWidget: const SizedBox(
        width: double.infinity,
        height: 150,
      ),
      childTextWidget: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const SizedBox(
              width: 100,
              height: 25,
            ),
          ),
        ],
      ),
    );
  }
}

class BuildContent extends StatelessWidget {
  final Widget childImageWidget;
  final Widget childTextWidget;
  final bool shimmerView;
  const BuildContent({
    required this.childImageWidget,
    required this.childTextWidget,
    this.shimmerView = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BuildBackground(
      shimmerView: shimmerView,
      child: SizedBox(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 180,
            minWidth: 100,
            maxHeight: 250,
          ),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: context.color.grey,
                  ),
                  child: childImageWidget,
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 3,
                        horizontal: 15,
                      ),
                      child: SizedBox(
                        width: 140,
                        child: childTextWidget,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildBackground extends StatelessWidget {
  final Widget child;
  final bool shimmerView;
  const BuildBackground({
    required this.child,
    this.shimmerView = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 5,
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: context.color.whiteApp,
          ),
          child: shimmerView
              ? Shimmer.fromColors(
                  baseColor: Colors.grey.shade400,
                  highlightColor: Colors.grey.shade600,
                  child: child,
                )
              : child,
        ),
      ),
    );
  }
}
