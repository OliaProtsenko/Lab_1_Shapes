import 'package:flutter/material.dart';
import 'package:lab_1_shapes/model/quadrangle.dart';

class QuadranglePainter extends CustomPainter {
  QuadranglePainter({
    required this.quadrangle,
    required this.color,
  });

  final Quadrangle quadrangle;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path()
      ..moveTo(size.width/2 + quadrangle.a.x*20, size.height/2 - quadrangle.a.y*20)
      ..lineTo(size.width/2 + quadrangle.b.x*20, size.height/2 - quadrangle.b.y*20)
      ..lineTo(size.width/2 + quadrangle.c.x*20, size.height/2 - quadrangle.c.y*20)
      ..lineTo(size.width/2 + quadrangle.d.x*20, size.height/2 - quadrangle.d.y*20)
      ..lineTo(size.width/2 + quadrangle.a.x*20, size.height/2- quadrangle.a.y*20);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
