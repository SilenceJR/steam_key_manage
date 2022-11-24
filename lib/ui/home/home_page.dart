import 'package:flutter/material.dart';
import 'package:steam_key_manage/utils/data_parser.dart';

import '../../db/steam_key_db.dart';
import '../../http/http_client.dart';
import '../../model/steam_key_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SteamKeyModel> data = [];
  late SteamKeyDb db;
  late Client _client;

  final TextEditingController _editingController = TextEditingController();

  @override
  void initState() {
    db = SteamKeyDb()..init();
    _client = Client()..init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
              onPressed: () {
                setState(() {
                  data.clear();
                });
              },
              child: const Text('清空')),
          ElevatedButton(onPressed: run, child: const Text('启动')),
          ElevatedButton(onPressed: _find, child: const Text('查询')),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _editingController,
                  decoration: const InputDecoration.collapsed(hintText: '游戏名称'),
                ),
              ),
              ElevatedButton(onPressed: search, child: const Text('查询'))
            ],
          ),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (_, index) {
                var item = data[index];
                print('${item.image}');
                return ListTile(
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('$index'),
                      Image.network(
                        item.image,
                        width: 100,
                        height: 60,
                      )
                    ],
                  ),
                  title: Text(item.name),
                );
              },
              itemCount: data.length,
            ),
          )
        ],
      ),
    );
  }

  void run() async {
    print('正在请求');
    var res = await _client.dio.get('https://store.steampowered.com/search',
        // queryParameters: {'term': '112 Operator'});
        queryParameters: {'term': ''});

    DataParser().steamSearch(res.data).listen((event) async {
      int id = await db.insert(event);
      setState(() {
        data.add(event);
      });
    });
  }

  void search() async {
    print('正在请求');
    var res = await _client.dio.get('https://store.steampowered.com/search',
        // queryParameters: {'term': '112 Operator'});
        queryParameters: {'term': _editingController.text});

    DataParser().steamSearch(res.data).listen((event) async {
      int id = await db.insert(event);
      setState(() {
        data.add(event);
      });
    });
  }

  void _find() async {
    var res = await db.findAll();
    setState(() {
      data.addAll(res);
    });
  }
}
