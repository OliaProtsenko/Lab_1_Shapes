import 'dart:math';

import 'package:lab_1_shapes/model/point_json_converter.dart';
import 'package:lab_1_shapes/model/shape.dart';
import 'package:json_annotation/json_annotation.dart';

part 'circle.g.dart';
@JsonSerializable()
@PointJsonConverter()
class Circle extends Shape {
  Circle({required this.a, required this.r,required DateTime createdAt}):super(createdAt);

 final double r;
 final Point<double> a;

  @override
  double get perimeter => _perimeter();

  @override
  double get area => _area();

  @override
  String get name=>'Circle';


  double _perimeter() {
    return 2*pi*r;
  }

  double _area() {
   return pi*r*r;
  }

  /// Connect the generated [_$TriangleFromJson] function to the `fromJson`
  /// factory.
  factory Circle.fromJson(Map<String, dynamic> json) =>
      _$CircleFromJson(json);

  /// Connect the generated [_$TriangleToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CircleToJson(this);
}
