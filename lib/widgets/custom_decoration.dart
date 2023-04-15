import 'package:flutter/material.dart';

class CustomDecoration extends Decoration {
  const CustomDecoration(this._patternLength);

  final double _patternLength;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) =>
      _CustomDecorationPainter(_patternLength);
}

class _CustomDecorationPainter extends BoxPainter {
  _CustomDecorationPainter(this._patternLength);

  final double _patternLength;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect bounds = offset & configuration.size!;
    _drawDecoration(canvas, bounds);
  }

  void _drawDecoration(Canvas canvas, Rect bounds) {
    final Paint innerPaint = Paint()..color = Colors.lightBlue;
    final Paint outerPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final Path innerPath = Path();
    final Path outerPath = Path();

    _addVerticalSides(bounds, innerPath, outerPath);
    _addHorizontalSides(bounds, innerPath, outerPath);

    canvas.drawPath(innerPath, innerPaint);
    canvas.drawPath(outerPath, outerPaint);
  }

  void _addVerticalSides(Rect bounds, Path innerPath, Path outerPath) {
    final int patternsCount = bounds.height ~/ _patternLength;
    final double accurateLength = bounds.height / patternsCount;

    for (int i = 0; i < patternsCount; ++i) {
      final Rect leftSidePatternRect = Rect.fromLTWH(
        bounds.left,
        bounds.top + (i * accurateLength),
        accurateLength,
        accurateLength,
      );

      final Rect rightSidePatternRect = Rect.fromLTWH(
        bounds.right - accurateLength,
        bounds.top + (i * accurateLength),
        accurateLength,
        accurateLength,
      );

      innerPath.addRotatedRect(leftSidePatternRect);
      outerPath.addRect(leftSidePatternRect);

      innerPath.addRotatedRect(rightSidePatternRect);
      outerPath.addRect(rightSidePatternRect);
    }
  }

  void _addHorizontalSides(Rect bounds, Path innerPath, Path outerPath) {
    final int patternsCount = bounds.width ~/ _patternLength;

    final double accurateLength = bounds.width / patternsCount;

    for (int i = 0; i < patternsCount; ++i) {
      final Rect topSidePatternRect = Rect.fromLTWH(
        bounds.left + (i * accurateLength),
        bounds.top,
        accurateLength,
        accurateLength,
      );

      final Rect bottomSidePatternRect = Rect.fromLTWH(
        bounds.left + (i * accurateLength),
        bounds.bottom - accurateLength,
        accurateLength,
        accurateLength,
      );

      innerPath.addRotatedRect(topSidePatternRect);
      outerPath.addRect(topSidePatternRect);

      innerPath.addRotatedRect(bottomSidePatternRect);
      outerPath.addRect(bottomSidePatternRect);
    }
  }
}

extension on Path {
  void addRotatedRect(Rect bounds) {
    moveTo(bounds.left, bounds.center.dy);
    lineTo(bounds.center.dx, bounds.top);
    lineTo(bounds.right, bounds.center.dy);
    lineTo(bounds.center.dx, bounds.bottom);
    close();
  }
}
