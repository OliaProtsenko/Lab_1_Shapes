// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'circle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Circle _$CircleFromJson(Map<String, dynamic> json) => Circle(
      a: const PointJsonConverter().fromJson(json['a'] as String),
      r: (json['r'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$CircleToJson(Circle instance) => <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'r': instance.r,
      'a': const PointJsonConverter().toJson(instance.a),
    };
