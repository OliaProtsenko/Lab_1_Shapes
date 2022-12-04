// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ellipsis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ellipsis _$EllipsisFromJson(Map<String, dynamic> json) => Ellipsis(
      (json['a'] as num).toDouble(),
      (json['b'] as num).toDouble(),
      DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$EllipsisToJson(Ellipsis instance) => <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'a': instance.a,
      'b': instance.b,
    };
