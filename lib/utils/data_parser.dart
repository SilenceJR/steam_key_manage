import 'package:html/parser.dart' show parse;
import 'package:steam_key_manage/model/steam_game_model.dart';

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
            chineseName: data['title'],
            link: data['link'],
            image: data['img']);
      }
    }
  }
}
