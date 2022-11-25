import 'package:json_annotation/json_annotation.dart';

part 'humble_order_model.g.dart';

///
///

@JsonSerializable()
class HumbleOrderModel {
  @JsonKey(name: 'amount_spent', defaultValue: 0)
  double? amountSpent;
  String? gamekey, uid, created, currency;
  HumbleOrderProductModel? product;
  @JsonKey(name: 'tpkd_dict')
  HumbleOrderTpkdModel? tpkd;

  HumbleOrderModel(
      {this.amountSpent,
      this.gamekey,
      this.uid,
      this.created,
      this.currency,
      this.product,
      this.tpkd});

  factory HumbleOrderModel.fromJson(Map<String, dynamic> json) =>
      _$HumbleOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$HumbleOrderModelToJson(this);

  @override
  String toString() {
    return 'HumbleOrderModel{amountSpent: $amountSpent, gamekey: $gamekey, uid: $uid, created: $created, currency: $currency, product: $product, tpkd: $tpkd}';
  }
}

@JsonSerializable()
class HumbleOrderProductModel {
  String? category;
  @JsonKey(name: 'machine_name')
  String? machineName;
  @JsonKey(name: 'choice_url')
  String? choiceUrl;
  @JsonKey(name: 'post_purchase_text')
  String? postPurchaseText;
  @JsonKey(name: 'human_name')
  String? humanName;
  @JsonKey(name: 'partial_gift_enabled')
  bool? partialGiftEnabled;
  @JsonKey(name: 'is_subs_v2_product')
  bool? isSubsV2Product;
  @JsonKey(name: 'is_subs_v3_product')
  bool? isSubsV3Product;
  @JsonKey(name: 'empty_tpkds')
  Map? emptyTpkds;

  HumbleOrderProductModel(
      {this.category,
      this.machineName,
      this.choiceUrl,
      this.postPurchaseText,
      this.humanName,
      this.partialGiftEnabled,
      this.isSubsV2Product,
      this.isSubsV3Product,
      this.emptyTpkds});

  factory HumbleOrderProductModel.fromJson(Map<String, dynamic> json) =>
      _$HumbleOrderProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$HumbleOrderProductModelToJson(this);

  @override
  String toString() {
    return 'HumbleOrderProductModel{category: $category, machineName: $machineName, choiceUrl: $choiceUrl, postPurchaseText: $postPurchaseText, humanName: $humanName, partialGiftEnabled: $partialGiftEnabled, isSubsV2Product: $isSubsV2Product, isSubsV3Product: $isSubsV3Product, emptyTpkds: $emptyTpkds}';
  }
}

@JsonSerializable()
class HumbleOrderTpkdModel {
  @JsonKey(name: 'all_tpks')
  List<HumbleOrderTpksModel>? allTpks;

  HumbleOrderTpkdModel({this.allTpks});

  factory HumbleOrderTpkdModel.fromJson(Map<String, dynamic> json) =>
      _$HumbleOrderTpkdModelFromJson(json);

  Map<String, dynamic> toJson() => _$HumbleOrderTpkdModelToJson(this);

  @override
  String toString() {
    return 'HumbleOrderTpkdModel{allTpks: $allTpks}';
  }
}

@JsonSerializable()
class HumbleOrderTpksModel {
  @JsonKey(name: 'is_gift', defaultValue: false)
  bool? isGift;
  @JsonKey(name: 'machine_name')
  String? machineName;
  String? gamekey;
  @JsonKey(name: 'key_type')
  String? keyType;
  @JsonKey(name: 'instructions_html')
  String? instructionsHtml;
  @JsonKey(name: 'redeemed_key_val')
  String? redeemedKeyVal;
  @JsonKey(name: 'key_type_human_name')
  String? keyTypeHumanName;
  @JsonKey(name: 'steam_app_id')
  int? steamAppId;
  @JsonKey(name: 'human_name')
  String? humanName;
  @JsonKey(name: 'preinstruction_text')
  String? preinstructionText;
  @JsonKey(name: 'class')
  String? clazz;
  String? disclaimer;

  @JsonKey(name: 'exclusive_countries')
  List<String>? exclusiveCountries;
  @JsonKey(name: 'disallowed_countries')
  List<String>? disallowedCountries;

  @JsonKey(name: 'num_days_until_expired')
  int? numDaysUntilExpired;
  @JsonKey(name: 'keyindex')
  int? keyIndex;

  @JsonKey(
      name: 'show_custom_instructions_in_user_libraries', defaultValue: false)
  bool? showCustomInstructionsInUserLibraries;
  @JsonKey(name: 'visible', defaultValue: false)
  bool? visible;
  @JsonKey(name: 'display_separately', defaultValue: false)
  bool? displaySeparately;
  @JsonKey(name: 'auto_expand', defaultValue: false)
  bool? autoExpand;
  @JsonKey(name: 'is_expired', defaultValue: false)
  bool? isExpired;

  HumbleOrderTpksModel(
      {this.isGift,
      this.machineName,
      this.gamekey,
      this.keyType,
      this.instructionsHtml,
      this.redeemedKeyVal,
      this.keyTypeHumanName,
      this.steamAppId,
      this.humanName,
      this.preinstructionText,
      this.clazz,
      this.disclaimer,
      this.exclusiveCountries,
      this.disallowedCountries,
      this.numDaysUntilExpired,
      this.keyIndex,
      this.showCustomInstructionsInUserLibraries,
      this.visible,
      this.displaySeparately,
      this.autoExpand,
      this.isExpired});

  factory HumbleOrderTpksModel.fromJson(Map<String, dynamic> json) =>
      _$HumbleOrderTpksModelFromJson(json);

  Map<String, dynamic> toJson() => _$HumbleOrderTpksModelToJson(this);

  @override
  String toString() {
    return 'HumbleOrderTpksModel{isGift: $isGift, machineName: $machineName, gamekey: $gamekey, keyType: $keyType, instructionsHtml: $instructionsHtml, redeemedKeyVal: $redeemedKeyVal, keyTypeHumanName: $keyTypeHumanName, steamAppId: $steamAppId, humanName: $humanName, preinstructionText: $preinstructionText, clazz: $clazz, disclaimer: $disclaimer, exclusiveCountries: $exclusiveCountries, disallowedCountries: $disallowedCountries, numDaysUntilExpired: $numDaysUntilExpired, keyIndex: $keyIndex, showCustomInstructionsInUserLibraries: $showCustomInstructionsInUserLibraries, visible: $visible, displaySeparately: $displaySeparately, autoExpand: $autoExpand, isExpired: $isExpired}';
  }
}
