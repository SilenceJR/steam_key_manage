// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'humble_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HumbleOrderModel _$HumbleOrderModelFromJson(Map<String, dynamic> json) =>
    HumbleOrderModel(
      amountSpent: (json['amount_spent'] as num?)?.toDouble() ?? 0,
      gamekey: json['gamekey'] as String?,
      uid: json['uid'] as String?,
      created: json['created'] as String?,
      currency: json['currency'] as String?,
      product: json['product'] == null
          ? null
          : HumbleOrderProductModel.fromJson(
              json['product'] as Map<String, dynamic>),
      tpkd: json['tpkd_dict'] == null
          ? null
          : HumbleOrderTpkdModel.fromJson(
              json['tpkd_dict'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HumbleOrderModelToJson(HumbleOrderModel instance) =>
    <String, dynamic>{
      'amount_spent': instance.amountSpent,
      'gamekey': instance.gamekey,
      'uid': instance.uid,
      'created': instance.created,
      'currency': instance.currency,
      'product': instance.product,
      'tpkd_dict': instance.tpkd,
    };

HumbleOrderProductModel _$HumbleOrderProductModelFromJson(
        Map<String, dynamic> json) =>
    HumbleOrderProductModel(
      category: json['category'] as String?,
      machineName: json['machine_name'] as String?,
      choiceUrl: json['choice_url'] as String?,
      postPurchaseText: json['post_purchase_text'] as String?,
      humanName: json['human_name'] as String?,
      partialGiftEnabled: json['partial_gift_enabled'] as bool?,
      isSubsV2Product: json['is_subs_v2_product'] as bool?,
      isSubsV3Product: json['is_subs_v3_product'] as bool?,
      emptyTpkds: json['empty_tpkds'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$HumbleOrderProductModelToJson(
        HumbleOrderProductModel instance) =>
    <String, dynamic>{
      'category': instance.category,
      'machine_name': instance.machineName,
      'choice_url': instance.choiceUrl,
      'post_purchase_text': instance.postPurchaseText,
      'human_name': instance.humanName,
      'partial_gift_enabled': instance.partialGiftEnabled,
      'is_subs_v2_product': instance.isSubsV2Product,
      'is_subs_v3_product': instance.isSubsV3Product,
      'empty_tpkds': instance.emptyTpkds,
    };

HumbleOrderTpkdModel _$HumbleOrderTpkdModelFromJson(
        Map<String, dynamic> json) =>
    HumbleOrderTpkdModel(
      allTpks: (json['all_tpks'] as List<dynamic>?)
          ?.map((e) => HumbleOrderTpksModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HumbleOrderTpkdModelToJson(
        HumbleOrderTpkdModel instance) =>
    <String, dynamic>{
      'all_tpks': instance.allTpks,
    };

HumbleOrderTpksModel _$HumbleOrderTpksModelFromJson(
        Map<String, dynamic> json) =>
    HumbleOrderTpksModel(
      isGift: json['is_gift'] as bool? ?? false,
      machineName: json['machine_name'] as String?,
      gamekey: json['gamekey'] as String?,
      keyType: json['key_type'] as String?,
      instructionsHtml: json['instructions_html'] as String?,
      redeemedKeyVal: json['redeemed_key_val'] as String?,
      keyTypeHumanName: json['key_type_human_name'] as String?,
      steamAppId: json['steam_app_id'] as int?,
      humanName: json['human_name'] as String?,
      preinstructionText: json['preinstruction_text'] as String?,
      clazz: json['class'] as String?,
      disclaimer: json['disclaimer'] as String?,
      exclusiveCountries: (json['exclusive_countries'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      disallowedCountries: (json['disallowed_countries'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      numDaysUntilExpired: json['num_days_until_expired'] as int?,
      keyIndex: json['keyindex'] as int?,
      showCustomInstructionsInUserLibraries:
          json['show_custom_instructions_in_user_libraries'] as bool? ?? false,
      visible: json['visible'] as bool? ?? false,
      displaySeparately: json['display_separately'] as bool? ?? false,
      autoExpand: json['auto_expand'] as bool? ?? false,
      isExpired: json['is_expired'] as bool? ?? false,
    );

Map<String, dynamic> _$HumbleOrderTpksModelToJson(
        HumbleOrderTpksModel instance) =>
    <String, dynamic>{
      'is_gift': instance.isGift,
      'machine_name': instance.machineName,
      'gamekey': instance.gamekey,
      'key_type': instance.keyType,
      'instructions_html': instance.instructionsHtml,
      'redeemed_key_val': instance.redeemedKeyVal,
      'key_type_human_name': instance.keyTypeHumanName,
      'steam_app_id': instance.steamAppId,
      'human_name': instance.humanName,
      'preinstruction_text': instance.preinstructionText,
      'class': instance.clazz,
      'disclaimer': instance.disclaimer,
      'exclusive_countries': instance.exclusiveCountries,
      'disallowed_countries': instance.disallowedCountries,
      'num_days_until_expired': instance.numDaysUntilExpired,
      'keyindex': instance.keyIndex,
      'show_custom_instructions_in_user_libraries':
          instance.showCustomInstructionsInUserLibraries,
      'visible': instance.visible,
      'display_separately': instance.displaySeparately,
      'auto_expand': instance.autoExpand,
      'is_expired': instance.isExpired,
    };
