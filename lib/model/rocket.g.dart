// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rocket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rocket _$RocketFromJson(Map<String, dynamic> json) {
  return Rocket(
    json['name'] as String,
    json['type'] as String,
    json['first_flight'] as String,
  );
}

Map<String, dynamic> _$RocketToJson(Rocket instance) => <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'first_flight': instance.firstFlight,
    };
