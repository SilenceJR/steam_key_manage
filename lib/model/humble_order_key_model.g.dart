// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'humble_order_key_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HumbleOrderKeyModel _$HumbleOrderKeyModelFromJson(Map<String, dynamic> json) =>
    HumbleOrderKeyModel(
      orderKey: json['orderKey'] as String,
      productName: json['productName'] as String,
      orderPlaced: json['orderPlaced'] as String,
      user: json['user'] as String,
    );

Map<String, dynamic> _$HumbleOrderKeyModelToJson(
        HumbleOrderKeyModel instance) =>
    <String, dynamic>{
      'orderKey': instance.orderKey,
      'productName': instance.productName,
      'orderPlaced': instance.orderPlaced,
      'user': instance.user,
    };
