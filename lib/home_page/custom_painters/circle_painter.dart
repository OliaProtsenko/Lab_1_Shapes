import 'package:flutter/material.dart';
import 'package:lab_1_shapes/model/circle.dart';

class CirclePainter extends CustomPainter {
  CirclePainter({
    required this.circle,
    required this.color,
  });

  final Circle circle;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    canvas.drawCircle(Offset(size.width/2 + circle.a.x*20,size.height/2-circle.a.y*20),circle.r*20,paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
