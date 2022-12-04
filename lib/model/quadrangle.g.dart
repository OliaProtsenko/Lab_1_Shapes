// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quadrangle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quadrangle _$QuadrangleFromJson(Map<String, dynamic> json) => Quadrangle(
      const PointJsonConverter().fromJson(json['a'] as String),
      const PointJsonConverter().fromJson(json['b'] as String),
      const PointJsonConverter().fromJson(json['c'] as String),
      const PointJsonConverter().fromJson(json['d'] as String),
      DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$QuadrangleToJson(Quadrangle instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'a': const PointJsonConverter().toJson(instance.a),
      'b': const PointJsonConverter().toJson(instance.b),
      'c': const PointJsonConverter().toJson(instance.c),
      'd': const PointJsonConverter().toJson(instance.d),
    };
