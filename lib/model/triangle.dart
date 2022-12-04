import 'dart:math';
import 'package:lab_1_shapes/model/point_json_converter.dart';
import 'package:lab_1_shapes/model/shape.dart';
import 'package:json_annotation/json_annotation.dart';
part 'triangle.g.dart';
@JsonSerializable()
@PointJsonConverter()
class Triangle extends Shape {
  Triangle(this.a, this.b, this.c,DateTime createdAt):super(createdAt) ;


  final Point<double> a;
  final Point<double> b;
  final Point<double> c;

  @override
  double get perimeter => _perimeter();

  @override
  double get area => _area();

  @override
  String get name=>'Triangle';

  double _perimeter() {
    return a.distanceTo(b) + b.distanceTo(c) + c.distanceTo(a);
  }

  double _area() {
    double p = _perimeter() / 2;
    return sqrt(p *
        (p - a.distanceTo(b)) *
        (p - b.distanceTo(c)) *
        (p - c.distanceTo(a)));
  }
  /// Connect the generated [_$TriangleFromJson] function to the `fromJson`
  /// factory.
  factory Triangle.fromJson(Map<String, dynamic> json) => _$TriangleFromJson(json);

  /// Connect the generated [_$TriangleToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$TriangleToJson(this);
}
