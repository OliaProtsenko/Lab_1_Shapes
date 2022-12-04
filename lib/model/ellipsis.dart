import 'dart:math';

import 'package:lab_1_shapes/model/point_json_converter.dart';
import 'package:lab_1_shapes/model/shape.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ellipsis.g.dart';

@JsonSerializable()
@PointJsonConverter()
class Ellipsis extends Shape {
  Ellipsis(this.a, this.b,DateTime createdAt):super(createdAt);
  final double a;
 final  double b;

  @override
  double get perimeter => _perimeter();

  @override
  double get area => _area();

  @override
  String get name=>'Ellipsis';


  double _perimeter() {
    return 4*(pi*a*b+(a-b).abs())/(a+b);//a.distanceTo(b) + b.distanceTo(c) + c.distanceTo(a);
  }

  double _area() {
    return pi*a*b;
    // double p = _perimeter() / 2;
    // return sqrt(p *
    //     (p - a.distanceTo(b)) *
    //     (p - b.distanceTo(c)) *
    //     (p - c.distanceTo(a)));
  }
  /// Connect the generated [_$TriangleFromJson] function to the `fromJson`
  /// factory.
  factory Ellipsis.fromJson(Map<String, dynamic> json) =>
      _$EllipsisFromJson(json);

  /// Connect the generated [_$TriangleToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$EllipsisToJson(this);

}
