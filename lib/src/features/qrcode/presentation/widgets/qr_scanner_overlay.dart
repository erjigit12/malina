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

    final overlayPath = Path()..addRect(Offset.zero & size);
    final frameRect = _frameRect(size, 32);

    overlayPath.addRect(frameRect);
    canvas.drawPath(
      Path.combine(
        PathOperation.difference,
        Path()..addRect(Offset.zero & size),
        overlayPath,
      ),
      overlayPaint,
    );

    final fillPaint =
        Paint()
          ..color = const Color(0xFF1F1F1F)
          ..style = PaintingStyle.fill;
    canvas.drawRect(frameRect, fillPaint);

    _drawCorner(canvas, frameRect.topLeft, const Offset(28, 0), const Offset(0, 28));
    _drawCorner(
      canvas,
      frameRect.topRight,
      const Offset(-28, 0),
      const Offset(0, 28),
    );
    _drawCorner(
      canvas,
      frameRect.bottomLeft,
      const Offset(28, 0),
      const Offset(0, -28),
    );
    _drawCorner(
      canvas,
      frameRect.bottomRight,
      const Offset(-28, 0),
      const Offset(0, -28),
    );
  }

  Rect _frameRect(Size size, double margin) {
    final length = size.width - margin * 2;
    final top = size.height * 0.18;
    return Rect.fromLTWH(margin, top, length, length);
  }

  void _drawCorner(
    Canvas canvas,
    Offset origin,
    Offset horizontalOffset,
    Offset verticalOffset,
  ) {
    final paint =
        Paint()
          ..color = Colors.white
          ..strokeWidth = 4
          ..strokeCap = StrokeCap.round;

    canvas.drawLine(origin, origin + horizontalOffset, paint);
    canvas.drawLine(origin, origin + verticalOffset, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
