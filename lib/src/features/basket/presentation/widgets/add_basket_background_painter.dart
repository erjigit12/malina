import 'package:flutter/material.dart';

class AddBasketBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = const Color(0xFFFFEEF2)
          ..style = PaintingStyle.fill;

    final path = Path();
    const cornerRadius = 28.0;
    final width = size.width;
    final height = size.height;
    final baseY = height - 28;

    path.moveTo(0, cornerRadius);
    path.quadraticBezierTo(0, 0, cornerRadius, 0);
    path.lineTo(width - cornerRadius, 0);
    path.quadraticBezierTo(width, 0, width, cornerRadius);
    path.lineTo(width, baseY);

    const amplitudes = [52.0, 52.0, 52.0];
    final segment = width / amplitudes.length;

    var currentX = width;
    for (var i = amplitudes.length - 1; i >= 0; i--) {
      final amplitude = amplitudes[i];
      final nextX = currentX - segment;
      final centerX = (currentX + nextX) / 2;

      path.cubicTo(
        currentX - segment * 0.2,
        baseY - amplitude * 0.25,
        currentX - segment * 0.35,
        baseY + amplitude,
        centerX,
        baseY + amplitude,
      );
      path.cubicTo(
        currentX - segment * 0.65,
        baseY + amplitude,
        currentX - segment * 0.8,
        baseY - amplitude * 0.25,
        nextX,
        baseY,
      );
      currentX = nextX;
    }

    path.lineTo(0, cornerRadius);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
