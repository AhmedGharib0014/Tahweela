import 'package:json_annotation/json_annotation.dart';

part 'rocket.g.dart';

@JsonSerializable()
class Rocket {
  String name;
  String type;
  @JsonKey(name: "first_flight")
  String firstFlight;
  Rocket(this.name, this.type, this.firstFlight);

  factory Rocket.fromJson(Map<String, dynamic> json) => _$RocketFromJson(json);

  Map<String, dynamic> toJson() => _$RocketToJson(this);
}
