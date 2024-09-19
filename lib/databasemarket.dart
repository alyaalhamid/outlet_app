import 'package:outlet_app/modelmarket.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Marketdatabase {
  static final Marketdatabase instance = Marketdatabase._init();

  static Database? _database;

  Marketdatabase._init();
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('market.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final intType = 'INT NOT NULL';

    await db.execute('''
    CREATE TABLE $tableMarket (
    ${MarketModel.market_code} $idType, 
    ${MarketModel.market_name} $textType,
    ${MarketModel.market_address} $textType,
    ${MarketModel.latitude_longtitude} $intType,
    ${MarketModel.photo} $textType,
    ${MarketModel.photo_path} $textType,
    ${MarketModel.created_date} $intType,
    ${MarketModel.update_date} $intType
    )
''');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
