import 'package:json_annotation/json_annotation.dart';

part 'humble_order_key_model.g.dart';

@JsonSerializable()
class HumbleOrderKeyModel {
  final String orderKey, productName, orderPlaced, user;

  HumbleOrderKeyModel(
      {required this.orderKey,
      required this.productName,
      required this.orderPlaced,
      required this.user});

  factory HumbleOrderKeyModel.fromJson(Map<String, dynamic> json) =>
      _$HumbleOrderKeyModelFromJson(json);

  Map<String, dynamic> toJson() => _$HumbleOrderKeyModelToJson(this);

  @override
  String toString() {
    return 'HumbleOrderKeyModel{orderKey: $orderKey, productName: $productName, orderPlaced: $orderPlaced}';
  }
}
