import 'package:flutter/material.dart';

class OverlayPainter extends CustomPainter {
  final double screenWidth;
  final double screenHeight;

  OverlayPainter({required this.screenWidth, required this.screenHeight});

  @override
  void paint(Canvas canvas, Size size) {
    final ovalWidth = screenWidth * 0.7;
    final ovalHeight = screenHeight * 0.5;
    final strokeWidth = 2.0;

    final ovalRect = Rect.fromCenter(
      center: Offset(screenWidth / 2, screenHeight / 2.1),
      width: ovalWidth,
      height: ovalHeight,
    );

    final ovalPath = Path()..addOval(ovalRect);

    final outerPath = Path()
      ..addRect(Rect.fromLTWH(0, 0, screenWidth, screenHeight));
    final overlayPath =
        Path.combine(PathOperation.difference, outerPath, ovalPath);

    final paint = Paint()
      ..color = Colors.black.withOpacity(0.65)
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawPath(overlayPath, paint);
    canvas.drawOval(ovalRect, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
