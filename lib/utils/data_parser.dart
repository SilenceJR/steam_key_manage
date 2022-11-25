import 'package:html/parser.dart' show parse;
import 'package:steam_key_manage/model/steam_game_model.dart';

import '../model/humble_order_key_model.dart';

class DataParser {
  Stream<SteamGameModel> steamSearch(dynamic data) async* {
    var parseHTML = parse(data);
    var searchRule = parseHTML.querySelector('div#search_result_container');
    var gameList = searchRule?.querySelectorAll('a');

    for (var element in gameList!) {
      var data = {};

      var appId = element.attributes['data-ds-appid'];
      var bundleId = element.attributes['data-ds-bundleid'];
      data['id'] = bundleId ?? appId;

      data['link'] = 'https://store.steampowered.com/app/${data['id']}';
      data['img'] = element.querySelector('img')?.attributes['src'];
      data['title'] = element.querySelector('.title')?.text;

      var searchPrice = element.querySelector(
          'div.col.search_price_discount_combined.responsive_secondrow');
      var discount = searchPrice
          ?.querySelector('div.col.search_discount.responsive_secondrow')
          ?.text;
      if (null == discount || discount.isEmpty) {
        data['price'] = element
            .querySelector('.col.search_price.responsive_secondrow')
            ?.text;
        data['currentPrice'] = element
            .querySelector('.col.search_price.responsive_secondrow')
            ?.text;
      } else {
        var info = element
            .querySelector('.col.search_price.discounted.responsive_secondrow');
        data['price'] = info?.querySelector('strike')?.text;
        data['currentPrice'] = info?.text;
        data['discount'] = element
            .querySelector('.col.search_discount.responsive_secondrow')
            ?.text;
      }
      if (null == data['id']) {
        continue;
      } else {
        yield SteamGameModel(
            appId: int.parse(data['id']),
            name: data['title'],
            link: data['link'],
            image: data['img']);
      }
    }
  }

  Future<List<HumbleOrderKeyModel>> findOrderKey(
      {required dynamic data, required String user}) async {
    var parseHTML = parse(data);
    var row = parseHTML.querySelectorAll('div.row.js-row');

    List<HumbleOrderKeyModel> result = [];

    for (var element in row) {
      var orderKey = element.attributes['data-hb-gamekey'];
      var productName = element.querySelector('.product-name')?.text;
      var orderPlaced = element.querySelector('.order-placed')?.text;

      if (null != orderKey && null != productName && null != orderPlaced) {
        result.add(HumbleOrderKeyModel(
            orderKey: orderKey,
            productName: productName,
            orderPlaced: orderPlaced,
            user: user));
      }
    }
    return result;
  }
}
