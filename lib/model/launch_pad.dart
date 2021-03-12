import 'package:json_annotation/json_annotation.dart';

part 'launch_pad.g.dart';

@JsonSerializable()
class LaunchPad {
  String name;
  String locality;
  String status;

  LaunchPad(this.name, this.locality, this.status);

  factory LaunchPad.fromJson(Map<String, dynamic> json) =>
      _$LaunchPadFromJson(json);

  Map<String, dynamic> toJson() => _$LaunchPadToJson(this);
}
