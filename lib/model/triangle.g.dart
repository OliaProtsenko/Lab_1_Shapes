// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'triangle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Triangle _$TriangleFromJson(Map<String, dynamic> json) => Triangle(
      const PointJsonConverter().fromJson(json['a'] as String),
      const PointJsonConverter().fromJson(json['b'] as String),
      const PointJsonConverter().fromJson(json['c'] as String),
      DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$TriangleToJson(Triangle instance) => <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'a': const PointJsonConverter().toJson(instance.a),
      'b': const PointJsonConverter().toJson(instance.b),
      'c': const PointJsonConverter().toJson(instance.c),
    };
