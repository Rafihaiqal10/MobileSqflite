import 'package:sqflite/sqflite.dart';

class DbHelper {
  static const String _dbPath = "makeup_db.db";
  static Database? _db;

  static Future<void> initDb() async {
    var dir = await getDatabasesPath();
    _db = await openDatabase(
      "$dir/$_dbPath",
      onCreate: (Database db, int version) async {
        await db.execute("""
      CREATE TABLE MakeUp (
        id INTEGER PRIMARY KEY,
        title TEXT,
        harga TEXT,
        image TEXT
      );
    """);
      },
      version: 2, );
  }

  static Database getDb() {
    if (_db == null) {
      throw Error();
    }

    return _db!;
  }
}
