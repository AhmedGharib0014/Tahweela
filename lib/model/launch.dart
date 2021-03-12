import 'package:json_annotation/json_annotation.dart';
import 'package:tahweela/model/launch_pad.dart';
import 'package:tahweela/model/links.dart';
import 'package:tahweela/model/payload.dart';
import 'package:tahweela/model/rocket.dart';

part 'launch.g.dart';

@JsonSerializable()
class Launch {
  String name;
  @JsonKey(name: "date_unix")
  int dateUnix;
  @JsonKey(name: "date_utc")
  String dateUtc;
  Links links;
  String rocket;
  String launchpad;
  List<String> payloads;

  Rocket currentRocket;
  LaunchPad currentLaunchPad;
  PayLoad currentPayLoad;

  Launch({this.name, this.dateUnix});
  factory Launch.fromJson(Map<String, dynamic> json) => _$LaunchFromJson(json);

  Map<String, dynamic> toJson() => _$LaunchToJson(this);
}
