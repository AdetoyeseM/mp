import 'package:flutter/material.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/themes/app_colors.dart'; 

class RipplePainter extends CustomPainter {
  final double radius;
  final double? strokeWidth;

  RipplePainter(this.radius, {this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = MoniepointColor.primaryColor .withOpacity(0.9)
      ..style = PaintingStyle.fill
      ..strokeWidth = strokeWidth ?? 2;

    final center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
