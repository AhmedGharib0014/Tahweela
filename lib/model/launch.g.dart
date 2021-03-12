// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Launch _$LaunchFromJson(Map<String, dynamic> json) {
  return Launch(
    name: json['name'] as String,
    dateUnix: json['date_unix'] as int,
  )
    ..dateUtc = json['date_utc'] as String
    ..links = json['links'] == null
        ? null
        : Links.fromJson(json['links'] as Map<String, dynamic>)
    ..rocket = json['rocket'] as String
    ..launchpad = json['launchpad'] as String
    ..payloads = (json['payloads'] as List)?.map((e) => e as String)?.toList()
    ..currentRocket = json['currentRocket'] == null
        ? null
        : Rocket.fromJson(json['currentRocket'] as Map<String, dynamic>)
    ..currentLaunchPad = json['currentLaunchPad'] == null
        ? null
        : LaunchPad.fromJson(json['currentLaunchPad'] as Map<String, dynamic>)
    ..currentPayLoad = json['currentPayLoad'] == null
        ? null
        : PayLoad.fromJson(json['currentPayLoad'] as Map<String, dynamic>);
}

Map<String, dynamic> _$LaunchToJson(Launch instance) => <String, dynamic>{
      'name': instance.name,
      'date_unix': instance.dateUnix,
      'date_utc': instance.dateUtc,
      'links': instance.links,
      'rocket': instance.rocket,
      'launchpad': instance.launchpad,
      'payloads': instance.payloads,
      'currentRocket': instance.currentRocket,
      'currentLaunchPad': instance.currentLaunchPad,
      'currentPayLoad': instance.currentPayLoad,
    };
