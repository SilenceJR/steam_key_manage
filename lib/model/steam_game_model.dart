import 'package:json_annotation/json_annotation.dart';

part 'steam_game_model.g.dart';

@JsonSerializable()
class SteamGameModel {
  late final int appId;
  late final String name, link, image;

  SteamGameModel(
      {required this.appId,
      required this.name,
      required this.link,
      required this.image});

  factory SteamGameModel.fromJson(Map<String, dynamic> json) =>
      _$SteamGameModelFromJson(json);

  Map<String, dynamic> toJson() => _$SteamGameModelToJson(this);
}
