import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:steam_key_manage/http/http_client.dart';

import '../../model/humble_order_model.dart';

class HumblePage extends StatefulWidget {
  const HumblePage({Key? key}) : super(key: key);

  @override
  State<HumblePage> createState() => _HumblePageState();
}

class _HumblePageState extends State<HumblePage> {
  late Client _client;
  HumbleOrderModel? data;
  String content = '';

  @override
  void initState() {
    _client = Client()..init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(onPressed: _run, child: const Text('run')),
            Text('${data?.gamekey}'),
            Text('${data?.product?.humanName}'),
            Flexible(
                child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (_, index) {
                var item = data?.tpkd?.allTpks?[index];
                return ListTile(
                  title: Text('${item?.humanName}'),
                  subtitle: Text('${item?.redeemedKeyVal}'),
                  trailing: TextButton(
                      onPressed: () {
                        // launchUrlString(
                        //     'https://store.steampowered.com/app/${item?.steamAppId}');
                      },
                      child: const Text('商店')),
                );
              },
              itemCount: data?.tpkd?.allTpks?.length,
            ))
          ],
        ),
      ),
    );
  }

  void _run() async {
    var res = await _client.dio.get(
        'https://www.humblebundle.com/api/v1/order/3AvK8cpkZPcaqFr6',
        queryParameters: {'all_tpkds': 'true'});

    print('res: $res');

    var humbleOrderModel = HumbleOrderModel.fromJson(res.data);

    log('humbleOrderModel: ${humbleOrderModel.toString()}');
    setState(() {
      data = humbleOrderModel;
      // content = humbleOrderModel.toString();
    });
  }
}
