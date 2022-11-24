// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'steam_key_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SteamKeyModel _$SteamKeyModelFromJson(Map<String, dynamic> json) =>
    SteamKeyModel(
      appId: json['appId'] as int,
      name: json['name'] as String,
      chineseName: json['chineseName'] as String,
      link: json['link'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$SteamKeyModelToJson(SteamKeyModel instance) =>
    <String, dynamic>{
      'appId': instance.appId,
      'name': instance.name,
      'chineseName': instance.chineseName,
      'link': instance.link,
      'image': instance.image,
    };
