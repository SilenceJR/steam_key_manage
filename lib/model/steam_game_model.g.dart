// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'steam_game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SteamGameModel _$SteamGameModelFromJson(Map<String, dynamic> json) =>
    SteamGameModel(
      appId: json['appId'] as int,
      name: json['name'] as String,
      link: json['link'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$SteamGameModelToJson(SteamGameModel instance) =>
    <String, dynamic>{
      'appId': instance.appId,
      'name': instance.name,
      'link': instance.link,
      'image': instance.image,
    };
