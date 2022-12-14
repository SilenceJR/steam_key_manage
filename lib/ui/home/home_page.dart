import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:steam_key_manage/utils/data_parser.dart';

import '../../db/steam_key_db.dart';
import '../../http/http_client.dart';
import '../../model/steam_game_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SteamGameModel> data = [];
  late SteamKeyDb db;
  late Client _client;
  final int pageCount = 50;
  int page = 1;

  final TextEditingController _editingController = TextEditingController();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: true);

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
          ElevatedButton(onPressed: _find, child: const Text('查询数据库')),
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
            child: SmartRefresher(
              controller: _refreshController,
              onLoading: _loading,
              onRefresh: _refresh,
              enablePullUp: true,
              enablePullDown: true,
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
        queryParameters: {'term': '', 'start': page * pageCount, 'count': 50});
    page += 1;
    DataParser().steamSearch(res.data).listen((event) async {
      setState(() {
        data.add(event);
      });
      db.insert(event);
    });
  }

  void search() async {
    page = 1;
    data.clear();
    print('正在请求');
    var res = await _client.dio.get(
        'https://store.steampowered.com/search/results',
        // queryParameters: {'term': '112 Operator'});
        queryParameters: {
          'term': _editingController.text,
          'start': page * pageCount,
          'count': 50
        });
    page += 1;
    DataParser().steamSearch(res.data).listen((event) async {
      setState(() {
        data.add(event);
      });
      db.insert(event);
    });
  }

  void _find() async {
    var res = await db.findAll();
    setState(() {
      data.addAll(res);
    });
  }

  void _loading() async {
    print('正在请求');
    var res = await _client.dio.get('https://store.steampowered.com/search',
        // queryParameters: {'term': '112 Operator'});
        queryParameters: {
          'term': _editingController.text,
          'start': page * pageCount,
          'count': 50
        });
    page += 1;
    if (_refreshController.isLoading) {
      _refreshController.loadComplete();
    }
    DataParser().steamSearch(res.data).listen((event) async {
      setState(() {
        data.add(event);
      });
      db.insert(event);
    });
  }

  void _refresh() async {
    print('正在请求');
    page = 1;
    var res = await _client.dio.get('https://store.steampowered.com/search',
        // queryParameters: {'term': '112 Operator'});
        queryParameters: {
          'term': _editingController.text,
          'start': page * pageCount,
          'count': 50
        });
    page += 1;
    if (_refreshController.isRefresh) {
      _refreshController.refreshCompleted(resetFooterState: true);
    }
    DataParser().steamSearch(res.data).listen((event) async {
      setState(() {
        data.add(event);
      });
      db.insert(event);
    });
  }
}
