import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:steam_key_manage/db/base_db.dart';

import '../model/steam_key_model.dart';
import 'open_options.dart';

const String _tableName = 'Game';

class SteamKeyDb extends BaseDB<SteamKeyModel> {
  var databaseFactory = databaseFactoryFfi;
  late Database db;

  String createSql = "create table $_tableName ("
      "appId INTEGER PRIMARY KEY,"
      "link Text,"
      "image Text,"
      "name Text,"
      "chineseName Text"
      ")";

  init() async {
    var databasesPath = await databaseFactory.getDatabasesPath();
    var path = join(databasesPath, "steam.db");
    db = await databaseFactory.openDatabase(path,
        options: SqfliteOpenDatabaseOptions(version: 1, onCreate: _onCreate));
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    return await db.execute(createSql);
  }

  @override
  Future<int> delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<int> insert(SteamKeyModel value) async {
    var existence = await find('$value.appId');
    if (null != existence) {
      return db.insert(_tableName, value.toJson());
    } else {
      return -1;
    }
  }

  @override
  Future<int> update() {
    // TODO: implement update
    throw UnimplementedError();
  }

  Future<List<SteamKeyModel>> findAll() async {
    var res = await db.query(
      _tableName,
    );
    List<SteamKeyModel> data = [];
    for (var value in res) {
      data.add(SteamKeyModel.fromJson(value));
    }
    return data;
  }

  Future<SteamKeyModel?> find(String appId) async {
    var res = await db.query(_tableName, where: "appId=?", whereArgs: [appId]);
    if (res.isNotEmpty) {
      return SteamKeyModel.fromJson(res.first);
    }
    return null;
  }
}
