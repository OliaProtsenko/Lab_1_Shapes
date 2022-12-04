import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lab_1_shapes/FileManager.dart';
import 'package:lab_1_shapes/home_page/custom_painters/triangle_painter.dart';
import 'package:lab_1_shapes/home_page/draw_page.dart';
import 'package:lab_1_shapes/model/ShapeTypes.dart';
import 'package:lab_1_shapes/model/circle.dart';
import 'package:lab_1_shapes/model/ellipsis.dart';
import 'package:lab_1_shapes/model/quadrangle.dart';
import 'package:lab_1_shapes/model/triangle.dart';
import '../main.dart';
import 'custom_painters/circle_painter.dart';
import 'custom_painters/ellipsis_painter.dart';
import 'custom_painters/quadrangle_painter.dart';

class CoordinatesInput extends StatelessWidget {
  CoordinatesInput({
    Key? key,
    required this.shapeType,
  }) : super(key: key);
  final ShapeType shapeType;
  final List<TextEditingController> _controllers = [];

  void _initControllers() {
    for (int i = 0; i < shapeType.countOfCoordinates() * 2; i++) {
      _controllers.add(TextEditingController());
    }
  }

  @override
  Widget build(BuildContext context) {
    _initControllers();
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Great choice!',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              'Please enter:',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            for (int i = 0; i < shapeType.countOfCoordinates(); i++)
              shapeType != ShapeType.circle
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          shapeType == ShapeType.ellipsis ? 'a:' : 'X:',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        SizedBox(
                          width: 100,
                          child: TextFormField(
                              controller: _controllers[i * 2],
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    RegExp(r"/^(-?)\d\.?\d*$")
                                        .hasMatch(value)) {
                                  return "Enter Correct Name";
                                } else {
                                  return null;
                                }
                              }),
                        ),
                        SizedBox(width: 20),
                        Text(
                          shapeType == ShapeType.ellipsis ? 'b:' : 'Y:',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        SizedBox(
                          width: 100,
                          child: TextFormField(
                              controller: _controllers[i * 2 + 1],
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    RegExp(r"/^(-?)\d\.?\d*$")
                                        .hasMatch(value)) {
                                  //(r'^(-?)(0|([1-9][0-9]*))(\\.[0-9]+)?$').hasMatch(value)) {
                                  return "Enter Correct Name";
                                } else {
                                  return null;
                                }
                              }),
                        ),
                      ],
                    )
                  : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Text(
                        _getCoordinateTitleForCircle(i),
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      SizedBox(
                        width: 100,
                        child: TextFormField(
                            controller: _controllers[i],
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  RegExp(r"/^(-?)\d\.?\d*$").hasMatch(value)) {
                                return "Enter Correct Name";
                              } else {
                                return null;
                              }
                            }),
                      ),
                    ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: () {
                final arguments = _getPainter();
                getIt<FileManager>().writeJson(arguments.shape);
                Navigator.pushNamed(context, '/draw', arguments: arguments);
              },
                 style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF81B29A),
                      textStyle: TextStyle(color: Color(0xFFF4F1DE))),
                  child: Text('Done')),
            )
          ],
        ));
  }

  DrawPageArguments _getPainter() {
    switch (shapeType) {
      case ShapeType.triangle:
        final triangle = Triangle(
            Point<double>(double.parse(_controllers[0].text),
                double.parse(_controllers[1].text)),
            Point<double>(double.parse(_controllers[2].text),
                double.parse(_controllers[3].text)),
            Point<double>(double.parse(_controllers[4].text),
                double.parse(_controllers[5].text)),
            DateTime.now());
        return DrawPageArguments(
            TrianglePainter(triangle: triangle, color: Colors.indigo),
            triangle);
      case ShapeType.quadrangle:
        final quadrangle = Quadrangle(
            Point<double>(double.parse(_controllers[0].text),
                double.parse(_controllers[1].text)),
            Point<double>(double.parse(_controllers[2].text),
                double.parse(_controllers[3].text)),
            Point<double>(double.parse(_controllers[4].text),
                double.parse(_controllers[5].text)),
            Point<double>(double.parse(_controllers[6].text),
                double.parse(_controllers[7].text)),
            DateTime.now());
        return DrawPageArguments(
            QuadranglePainter(
              quadrangle: quadrangle,
              color: Colors.indigo,
            ),
            quadrangle);
      case ShapeType.ellipsis:
        final ellipsis = Ellipsis(
          double.parse(_controllers[0].text),
          double.parse(_controllers[1].text),
          DateTime.now(),
        );
        return DrawPageArguments(
            EllipsisPainter(ellipsis: ellipsis, color: Colors.indigo),
            ellipsis);
      case ShapeType.circle:
        final circle = Circle(
            a: Point<double>(double.parse(_controllers[0].text),
                double.parse(_controllers[1].text)),
            r: double.parse(_controllers[2].text),
            createdAt: DateTime.now());
        return DrawPageArguments(
            CirclePainter(
              circle: circle,
              color: Colors.indigo,
            ),
            circle);
    }
  }

  String _getCoordinateTitleForCircle(int i) {
    if (i == 0) {
      return 'X: ';
    } else if (i == 1) {
      return 'Y: ';
    } else
      return 'R: ';
  }
}
