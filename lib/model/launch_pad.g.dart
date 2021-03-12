// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_pad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LaunchPad _$LaunchPadFromJson(Map<String, dynamic> json) {
  return LaunchPad(
    json['name'] as String,
    json['locality'] as String,
    json['status'] as String,
  );
}

Map<String, dynamic> _$LaunchPadToJson(LaunchPad instance) => <String, dynamic>{
      'name': instance.name,
      'locality': instance.locality,
      'status': instance.status,
    };
