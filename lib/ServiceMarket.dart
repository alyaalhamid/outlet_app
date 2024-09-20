import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class marketHelper {
  static Future<void> createTable(sql.Database database) async {
    await database.execute('''CREATE TABLE marketsTable(
      market_code INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
      market_name TEXT, 
      market_address TEXT, 
      latitude_longtitude INT, 
      photo TEXT,
      photo_path TEXT,
      created_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
      update_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )''');
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('dbmarket.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTable(database);
    });
  }

  static Future<int> createItem(String marketname, String marketaddress) async {
    final db = await marketHelper.db();

    final data = {
      'market_name': marketname,
      'market_address': marketaddress,
    };
    final id = await db.insert('marketsTable', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);

    return id;
  }

  static Future<List<Map<String, dynamic>>> getAllItem() async {
    final db = await marketHelper.db();
    return db.query('marketsTable', orderBy: 'market_code');
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await marketHelper.db();
    return db.query('marketsTable',
        where: 'market_code = ?', whereArgs: [id], limit: 1);
  }

  static Future<int> UpdateItem(
      int id, String marketname, String? marketaddress) async {
    final db = await marketHelper.db();

    final data = {
      'market_name': marketname,
      'market_address': marketaddress,
      'update_date': DateTime.now().toString()
    };

    final result = await db.update('marketsTable', data,
        where: 'market_code = ? ', whereArgs: [id]);
    return result;
  }

  static Future<void> deletedItem(int id) async {
    final db = await marketHelper.db();
    try {
      await db
          .delete('marketsTable', where: 'marked_code = ?', whereArgs: [id]);
    } catch (err) {
      debugPrint('something wrong : $err');
    }
  }
}
