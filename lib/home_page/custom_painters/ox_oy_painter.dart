import 'package:flutter/material.dart';

class OxOyPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black;

 for(int y=0;y<size.height/2;y=y+20){
   canvas.drawLine(Offset(size.width/2-5,size.height/2-y),Offset(size.width/2+5,size.height/2-y), paint);
   canvas.drawLine(Offset(size.width/2-5,size.height/2+y),Offset(size.width/2+5,size.height/2+y), paint);
 }
    for(int y=0;y<size.width/2;y=y+20){
      canvas.drawLine(Offset(size.width/2+y,size.height/2-5),Offset(size.width/2+y,size.height/2+5), paint);
      canvas.drawLine(Offset(size.width/2-y,size.height/2-5),Offset(size.width/2-y,size.height/2+5), paint);
    }

canvas.drawLine(Offset(size.width/2 , size.height), Offset(size.width/2 ,0), paint);
    canvas.drawLine(Offset(0 , (size.height/20.toInt()/2*20)), Offset(size.width , (size.height/20.toInt()/2*20)), paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
  return false;
  }

}