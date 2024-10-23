import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit_app/ui_kit_app.dart';

import 'dart:math' as mathW;

class RefreshWidget extends StatelessWidget {
  const RefreshWidget({
    required this.onRefresh,
    required this.child,
    super.key,
  });
  final Future<void> Function() onRefresh;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomMaterialIndicator(
      onRefresh: onRefresh,
      backgroundColor: context.color.whiteSmoke,
      indicatorBuilder: (context, controller) {
        return Padding(
          padding: const EdgeInsets.all(6),
          child: CircularProgressIndicator(
            color: context.color.irisBlue,
            value: controller.state.isLoading
                ? null
                : mathW.min(controller.value, 1),
          ),
        );
      },
      child: child,
    );
  }
}
