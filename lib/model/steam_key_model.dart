import 'package:json_annotation/json_annotation.dart';

part 'steam_key_model.g.dart';

@JsonSerializable()
class SteamKeyModel {
  late final int appId;
  late final String name, chineseName, link, image;

  SteamKeyModel(
      {required this.appId,
      required this.name,
      required this.chineseName,
      required this.link,
      required this.image});

  factory SteamKeyModel.fromJson(Map<String, dynamic> json) =>
      _$SteamKeyModelFromJson(json);

  Map<String, dynamic> toJson() => _$SteamKeyModelToJson(this);
}
