import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

class SQLHelper{
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        locationName TEXT,
        locationKey TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'dbloc.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> createItem(String locationName, String locationKey) async {
    final db = await SQLHelper.db();

    final data = {'locationName': locationName, 'locationKey': locationKey};
    final id = await db.insert('items', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<int> deleteItem(String locationName) async {
    final db = await SQLHelper.db();
    return db.delete('items', where: 'locationName = ?', whereArgs: [locationName]);
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    List<Map<String, dynamic>> maps = await db.query('items', orderBy: "id");
    print("Query Result: $maps");
    return maps;
  }

  static Future<bool> isExist(String locationName) async {
    final db = await SQLHelper.db();
    List<Map<String, dynamic>> maps = await db.query('items', where: "locationName = ?", whereArgs: [locationName]);
    print("Query Result: $maps");
    return maps.isNotEmpty;
  }

  // Offline Mode
  static Future<void> createWeatherTables(sql.Database database) async {
    await database.execute("""CREATE TABLE weather(
        locationKey TEXT PRIMARY KEY NOT NULL,
        locationName TEXT,
        
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }

}
