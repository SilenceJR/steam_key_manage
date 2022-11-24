// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'steam_key_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SteamKeyModel _$SteamKeyModelFromJson(Map<String, dynamic> json) =>
    SteamKeyModel(
      id: json['id'] as int?,
      appId: json['appId'] as int,
      key: json['key'] as String,
    )..valid = SteamKeyModel._fromValid(json['valid'] as int);

Map<String, dynamic> _$SteamKeyModelToJson(SteamKeyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'appId': instance.appId,
      'key': instance.key,
      'valid': SteamKeyModel._toValid(instance.valid),
    };
