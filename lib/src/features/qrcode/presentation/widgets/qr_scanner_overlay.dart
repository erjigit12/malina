// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class QrScannerOverlay extends StatelessWidget {
  const QrScannerOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomPaint(size: constraints.biggest, painter: _OverlayPainter());
      },
    );
  }
}

class _OverlayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final overlayPaint =
        Paint()
          ..color = Colors.black.withOpacity(0.65)
          ..style = PaintingStyle.fill;

    final screen = Offset.zero & size;
    final unit = size.shortestSide;
    final frameSize = unit * 0.68;
    final left = (size.width - frameSize) / 2;
    final top = (size.height - frameSize) / 2;
    final frameRect = Rect.fromLTWH(left, top, frameSize, frameSize);

    final outer = Path()..addRect(screen);
    final inner = Path()..addRect(frameRect);
    final difference = Path.combine(PathOperation.difference, outer, inner);
    canvas.drawPath(difference, overlayPaint);

    canvas.drawRect(
      frameRect,
      Paint()
        ..color = Colors.white.withOpacity(0.01)
        ..style = PaintingStyle.fill,
    );

    _drawCorners(canvas, frameRect);
  }

  void _drawCorners(Canvas canvas, Rect rect) {
    const cornerLengthRatio = 0.22;
    final length = rect.width * cornerLengthRatio;
    final strokePaint =
        Paint()
          ..color = Colors.white
          ..strokeWidth = 4
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    canvas
      ..drawLine(rect.topLeft, rect.topLeft.translate(length, 0), strokePaint)
      ..drawLine(rect.topLeft, rect.topLeft.translate(0, length), strokePaint)
      ..drawLine(rect.topRight, rect.topRight.translate(-length, 0), strokePaint)
      ..drawLine(rect.topRight, rect.topRight.translate(0, length), strokePaint)
      ..drawLine(rect.bottomLeft, rect.bottomLeft.translate(length, 0), strokePaint)
      ..drawLine(rect.bottomLeft, rect.bottomLeft.translate(0, -length), strokePaint)
      ..drawLine(
        rect.bottomRight,
        rect.bottomRight.translate(-length, 0),
        strokePaint,
      )
      ..drawLine(
        rect.bottomRight,
        rect.bottomRight.translate(0, -length),
        strokePaint,
      );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
