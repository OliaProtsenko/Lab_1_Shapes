import 'package:flutter/material.dart';
import 'package:lab_1_shapes/model/triangle.dart';

class TrianglePainter extends CustomPainter {
  TrianglePainter({
    required this.triangle,
    required this.color,
  });

  final Triangle triangle;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path()
      ..moveTo(size.width/2 + triangle.a.x*20, size.height/2 - triangle.a.y*20)
      ..lineTo(size.width/2 + triangle.b.x*20, size.height/2 - triangle.b.y*20)
      ..lineTo(size.width/2 + triangle.c.x*20, size.height/2 - triangle.c.y*20)
      ..lineTo(size.width/2 + triangle.a.x*20, size.height/2- triangle.a.y*20);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
