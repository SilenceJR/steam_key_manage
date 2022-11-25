import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:steam_key_manage/model/humble_order_key_model.dart';

import 'open_options.dart';

const String _tableName = 'HumbleOrderKey';
const String _tableKeyName = 'HumbleKey';

class HumbleDb {
  factory HumbleDb() => _getInstance();

  static HumbleDb get instance => _getInstance();

  static HumbleDb? _instance;

  HumbleDb._internal() {
    init();
  }

  static HumbleDb _getInstance() {
    return _instance ??= HumbleDb._internal();
  }

  var databaseFactory = databaseFactoryFfi;
  late Database db;

  String createSql = "create table $_tableName ("
      "id INTEGER AUTOINCREMENT,"
      "orderKey Text PRIMARY KEY ,"
      "productName Text,"
      "orderPlaced Text,"
      "user Text"
      ")";

  String createKeySql = "create table $_tableKeyName ("
      "id INTEGER AUTOINCREMENT,"
      "appId INTEGER PRIMARY KEY,"
      "key Text,"
      "valid INTEGER"
      ")";

  init() async {
    var databasesPath = await databaseFactory.getDatabasesPath();
    var path = join(databasesPath, "humble.db");
    db = await databaseFactory.openDatabase(path,
        options: SqfliteOpenDatabaseOptions(version: 1, onCreate: _onCreate));
  }

  FutureOr<List<Object?>> _onCreate(Database db, int version) async {
    var batch = db.batch();
    batch.execute(createSql);
    batch.execute(createKeySql);
    return await batch.commit();
  }

  Future<HumbleOrderKeyModel?> findOrder(String orderKey) async {
    var res =
        await db.query(_tableName, where: "orderKey=?", whereArgs: [orderKey]);
    if (res.isNotEmpty) {
      return HumbleOrderKeyModel.fromJson(res.first);
    }
    return null;
  }

  Future<int> saveOrder(HumbleOrderKeyModel data) async {
    if (await findOrder(data.orderKey) == null) {
      return db.insert(_tableName, data.toJson());
    } else {
      return -1;
    }
  }

  Future<List<Object?>> saveOrders(List<HumbleOrderKeyModel> data) async {
    var batch = db.batch();
    for (var value in data) {
      if (await findOrder(value.orderKey) == null) {
        batch.insert(_tableName, value.toJson());
      }
    }
    return await batch.commit();
  }

  Future<List<HumbleOrderKeyModel>> findAll() async {
    var res = await db.query(_tableName);
    return res.map((e) => HumbleOrderKeyModel.fromJson(e)).toList();
  }
}
