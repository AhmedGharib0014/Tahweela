// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayLoad _$PayLoadFromJson(Map<String, dynamic> json) {
  return PayLoad(
    json['name'] as String,
    json['type'] as String,
  );
}

Map<String, dynamic> _$PayLoadToJson(PayLoad instance) => <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
    };
