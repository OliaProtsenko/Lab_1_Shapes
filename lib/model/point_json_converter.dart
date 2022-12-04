
import 'dart:math';

import 'package:json_annotation/json_annotation.dart';
class PointJsonConverter implements JsonConverter<Point<double>, String> {
const PointJsonConverter();

  @override
  Point<double> fromJson(String json) {
    final doubles=json.split('-');
    return Point(double.tryParse(doubles[0])??0.0,double.tryParse(doubles[1])??0);
  }

  @override
  String toJson(Point<double> point) {
    // TODO: implement toJson
    return '${point.x}-${point.y}';
  }

}