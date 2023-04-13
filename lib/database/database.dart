import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Db {
  static final Db _instance = Db.internal();

  static Db get instance => _instance;

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _init();
    return _database!;
  }

  Future<Database> _init() async {
    var documentsDirectory = await getDatabasesPath();
    var path = join(documentsDirectory, 'database.db');
    return await openDatabase(
      path,
      onCreate: _onCreate,
      version: 1,
    );
  }

  Db.internal();

  Future _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE marvelCharacter(id INTEGER, name TEXT, description TEXT, thumbnailUrl TEXT);",
    );
  }
}
