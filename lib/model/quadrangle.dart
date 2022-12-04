import 'dart:math';

import 'package:lab_1_shapes/model/point_json_converter.dart';
import 'package:lab_1_shapes/model/shape.dart';
import 'package:lab_1_shapes/model/triangle.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quadrangle.g.dart';

@JsonSerializable()
@PointJsonConverter()
class Quadrangle extends Shape {
  Quadrangle(this.a, this.b, this.c, this.d,DateTime createdAt):super(createdAt);

  final Point<double> a;
  final Point<double> b;
  final Point<double> c;
  final Point<double> d;

  @override
  double get perimeter => _perimeter();

  @override
  double get area => _area();

  @override
  String get name=>'Quadrangle';

  double _perimeter() {
    return a.distanceTo(b) +
        b.distanceTo(c) +
        c.distanceTo(d) +
        d.distanceTo(a);
  }

  double _area() {
    final part1 = Triangle(a, b, c,DateTime.now()).area;
    final part2 = Triangle(c, d, a,DateTime.now()).area;
    return part1 + part2;
  }

  /// Connect the generated [_$TriangleFromJson] function to the `fromJson`
  /// factory.
  factory Quadrangle.fromJson(Map<String, dynamic> json) =>
      _$QuadrangleFromJson(json);

  /// Connect the generated [_$TriangleToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$QuadrangleToJson(this);
}
