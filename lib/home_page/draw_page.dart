import 'package:flutter/material.dart';
import 'package:lab_1_shapes/home_page/custom_painters/ox_oy_painter.dart';
import 'package:lab_1_shapes/model/shape.dart';
class DrawPage extends StatefulWidget {
  const DrawPage({Key? key,required this.arguments,}) : super(key: key);
final DrawPageArguments arguments;
  @override
  _DrawPageState createState() => _DrawPageState();
}

class _DrawPageState extends State<DrawPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Stack(
        children:[
          Positioned(
            left:10,
            top:10,
            child: Text( 'Area: ${widget.arguments.shape.area.toStringAsFixed(3)}',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Positioned(
            left:10,
            top:30,
            child: Text('Perimeter: ${widget.arguments.shape.perimeter.toStringAsFixed(3)}',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          CustomPaint(
          painter: widget.arguments.painter,
          foregroundPainter: OxOyPainter(),
          size:MediaQuery.of(context).size,
        )]
      )
    );
  }
}
class DrawPageArguments{
  DrawPageArguments(this.painter,this.shape);
  final CustomPainter painter;
  final Shape shape;
}