import 'package:json_annotation/json_annotation.dart';

part 'payload.g.dart';

@JsonSerializable()
class PayLoad {
  String name;
  String type;

  PayLoad(this.name, this.type);

  factory PayLoad.fromJson(Map<String, dynamic> json) =>
      _$PayLoadFromJson(json);

  Map<String, dynamic> toJson() => _$PayLoadToJson(this);
}
