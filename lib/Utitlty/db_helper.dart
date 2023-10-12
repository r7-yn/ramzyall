import 'dart:io';
import '../Moudle/category.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Database? _db;
  int version_db = 1;

  String TABLE_CATE_NAME = "Category";
  String CATE_ID = "cate_id";
  String CATE_NAME = "cate_name";
  String CATE_NUMBER = "art_number";

  Future<Database?> get database async {
    if (_db != null) {
      return _db;
    } else
      return _db = await createDatatbase();
  }

  Future<Database> createDatatbase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "Article.db");
    print(path);
    var creat_db =
        await openDatabase(path, version: version_db, onCreate: _onCreat);
    return creat_db;
  }

  void _onCreat(Database db, int newVer) {
    var sql = "CREATE TABLE IF NOT EXISTS $TABLE_CATE_NAME ( "
        "$CATE_ID INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,"
        "$CATE_NAME TEXT,"
        "$CATE_NUMBER INTEGER"
        ")";
    db.execute(sql);
  }

  Future<List<Map<String, dynamic>>> getData(String tableName) async {
    Database? db = await this.database;
    var result = await db!.query(tableName);
    return result;
  }

  Future<int> insertToCateTable(Category modul) async {
    Database? db = await this.database;
    var result;
    result = await db!.rawInsert(
        'INSERT INTO ${TABLE_CATE_NAME}'
        '(${CATE_NAME}, ${CATE_NUMBER})'
        'VALUES(?, ?)',
        [
          modul.cateName,
          modul.articlesNumber,
        ]);

    return result;
  }

  Future<int> deleteFromTable(
      String tableName, int modulid, String colIDName) async {
    Database? db = await this.database;

    var result =
        await db!.rawDelete("DELETE FROM $tableName WHERE $colIDName=$modulid");
    return result;
  }

  Future<int> update(String tableName, String colIDName, var object) async {
    var db = await this.database;
    var result = await db!.update(tableName, object.toMap(),
        where: '$colIDName = ?', whereArgs: [object.id]);
    return result;
  }

  Future<List<Category>> getCategoryList(String table_name) async {
    var cateMapList = await getData(table_name);
    print("door${cateMapList}");
    return cateMapList.map((row) => Category.fromMap(row)).toList();
  }
}
