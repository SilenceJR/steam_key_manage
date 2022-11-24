import 'package:json_annotation/json_annotation.dart';

part 'steam_key_model.g.dart';

@JsonSerializable()
class SteamKeyModel {
  final int? id;
  late final int appId;
  late final String key;
  @JsonKey(fromJson: _fromValid, toJson: _toValid)
  late final bool valid;

  SteamKeyModel({this.id, required this.appId, required this.key});

  factory SteamKeyModel.fromJson(Map<String, dynamic> json) =>
      _$SteamKeyModelFromJson(json);

  Map<String, dynamic> toJson() => _$SteamKeyModelToJson(this);

  static bool _fromValid(int value) => value == 1;

  static int _toValid(bool value) => value ? 1 : 0;
}
