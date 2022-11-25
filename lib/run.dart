import 'package:html/parser.dart' show parse;
import 'package:steam_key_manage/db/steam_key_db.dart';
import 'package:steam_key_manage/http/http_client.dart';

import 'model/steam_game_model.dart';

main() async {
  var client = Client()..init();
  print('正在请求');
  var res = await client.dio.get('https://store.steampowered.com/search',
      // queryParameters: {'term': '112 Operator'});
      queryParameters: {'term': ''});

  print('正在解析');
  var parseHTML = parse(res.data);
  var searchRule = parseHTML.querySelector('div#search_result_container');
  var gameList = searchRule?.querySelectorAll('a');

  var datas = [];
  var db = SteamKeyDb()..init();
  gameList?.forEach((element) {
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
      data['price'] =
          element.querySelector('.col.search_price.responsive_secondrow')?.text;
      data['currentPrice'] =
          element.querySelector('.col.search_price.responsive_secondrow')?.text;
    } else {
      var info = element
          .querySelector('.col.search_price.discounted.responsive_secondrow');
      data['price'] = info?.querySelector('strike')?.text;
      data['currentPrice'] = info?.text;
      data['discount'] = element
          .querySelector('.col.search_discount.responsive_secondrow')
          ?.text;
    }
    var steamKeyModel = SteamGameModel(
        appId: data['id'],
        name: data['title'],
        link: data['link'],
        image: data['img']);
    db.insert(steamKeyModel);
    datas.add(data);
    print(data);
  });
}
