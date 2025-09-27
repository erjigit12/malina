import 'package:flutter/material.dart';

class AddBasketBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = const Color(0xFFFFE9EF)
          ..style = PaintingStyle.fill;

    final path = Path();
    const radius = 28.0;
    final w = size.width;
    final h = size.height;
    final baseY = h - 28;

    path.moveTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);
    path.lineTo(w - radius, 0);
    path.quadraticBezierTo(w, 0, w, radius);
    path.lineTo(w, baseY);

    const amplitudes = [16.0, 100.0, 100.0, 100.0, 16.0];
    final segmentWidth = w / amplitudes.length;

    for (var i = amplitudes.length - 1; i >= 0; i--) {
      final startX = segmentWidth * (i + 1);
      final endX = segmentWidth * i;
      final amplitude = amplitudes[i];

      path.cubicTo(
        startX - segmentWidth * 0.35,
        baseY + amplitude,
        startX - segmentWidth * 0.65,
        baseY - amplitude,
        endX,
        baseY,
      );
    }

    path.lineTo(0, radius);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
