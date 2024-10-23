import 'package:flutter/material.dart';

class MyErrorScreen extends SingleChildRenderObjectWidget {
  const MyErrorScreen({required this.errorMessage, super.key});
  final FlutterErrorDetails? errorMessage;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderMyErrorScreen(errorMessage);
  }

  @override
  void updateRenderObject(
    BuildContext context,
    RenderMyErrorScreen renderObject,
  ) {
    if (errorMessage == null) return;
    renderObject.errorMessage = errorMessage;
  }
}

class RenderMyErrorScreen extends RenderBox {
  RenderMyErrorScreen(this._errorMessage);
  FlutterErrorDetails? _errorMessage;

  FlutterErrorDetails? get errorMessage => _errorMessage;
  set errorMessage(FlutterErrorDetails? value) {
    if (_errorMessage != value) {
      _errorMessage = value;
      markNeedsPaint();
    }
  }

  @override
  void performLayout() {
    size = constraints.biggest;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    final paint = Paint()..color = Colors.orange;
    canvas.drawRect(offset & size, paint);

    final textPainter = TextPainter(
      text: TextSpan(
        text: _errorMessage.toString(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    // ignore: cascade_invocations
    textPainter.layout(
      maxWidth: size.width,
    );

    final textOffset = Offset(
      (size.width - textPainter.width) / 2,
      (size.height - textPainter.height) / 2,
    );

    textPainter.paint(canvas, offset + textOffset);
  }
}

class CustomWidgetsFlutterBinding extends WidgetsFlutterBinding {}
