import 'package:flutter/material.dart';
import 'package:lab_1_shapes/model/ellipsis.dart';

class EllipsisPainter extends CustomPainter {
  EllipsisPainter({
    required this.ellipsis,
    required this.color,
  });

  final Ellipsis ellipsis;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final rect=Rect.fromCenter(center:Offset (size.width/2,size.height/2), width: ellipsis.a*2*20, height: ellipsis.b*2*20);

    canvas.drawOval(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
