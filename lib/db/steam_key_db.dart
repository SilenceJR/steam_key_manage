import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:steam_key_manage/db/base_db.dart';

import '../model/steam_game_model.dart';
import '../model/steam_key_model.dart';
import 'open_options.dart';

const String _tableName = 'Game';
const String _tableKeyName = 'Key';

class SteamKeyDb extends BaseDB<SteamGameModel> {
  var databaseFactory = databaseFactoryFfi;
  late Database db;

  String createSql = "create table $_tableName ("
      "appId INTEGER PRIMARY KEY,"
      "link Text,"
      "image Text,"
      "name Text"
      ")";

  String createKeySql = "create table $_tableKeyName ("
      "id INTEGER AUTOINCREMENT,"
      "appId INTEGER PRIMARY KEY,"
      "key Text,"
      "valid INTEGER"
      ")";

  init() async {
    var databasesPath = await databaseFactory.getDatabasesPath();
    var path = join(databasesPath, "steam.db");
    db = await databaseFactory.openDatabase(path,
        options: SqfliteOpenDatabaseOptions(version: 1, onCreate: _onCreate));
  }

  FutureOr<List<Object?>> _onCreate(Database db, int version) async {
    var batch = db.batch();
    batch.execute(createSql);
    batch.execute(createKeySql);
    return await batch.commit();
  }

  @override
  Future<int> delete(SteamGameModel value) {
    return db.delete(_tableName, where: "appId=?", whereArgs: [value.appId]);
  }

  @override
  Future<int> insert(SteamGameModel value) async {
    var existence = await find('$value.appId');
    if (null == existence) {
      return db.insert(_tableName, value.toJson());
    } else {
      return -1;
    }
  }

  Future<int> insertKey({required SteamGameModel game,required String key}) async {
    var existence = await findKey(key);
    if (null == existence) {
      return db.insert(_tableKeyName, SteamKeyModel(appId: game.appId, key: key).toJson());
    } else {
      return -1;
    }
  }

  @override
  Future<int> update(SteamGameModel value) async {
    var existence = await find("${value.appId}");
    if (null != existence) {
      return db.update(_tableName, value.toJson(),
          where: "appId=?", whereArgs: [value.appId]);
    }
    return -1;
  }

  Future<List<SteamGameModel>> findAll() async {
    var res = await db.query(
      _tableName,
    );
    List<SteamGameModel> data = [];
    for (var value in res) {
      data.add(SteamGameModel.fromJson(value));
    }
    return data;
  }

  Future<SteamGameModel?> find(String appId) async {
    var res = await db.query(_tableName, where: "appId=?", whereArgs: [appId]);
    if (res.isNotEmpty) {
      return SteamGameModel.fromJson(res.first);
    }
    return null;
  }

   Future<SteamKeyModel?> findKey(String key) async {
    var res = await db.query(_tableKeyName, where: "key=?", whereArgs: [key]);
    if (res.isNotEmpty) {
      return SteamKeyModel.fromJson(res.first);
    }
    return null;
  }
}
