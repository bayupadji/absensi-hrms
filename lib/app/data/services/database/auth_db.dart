import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AuthDb {
  static final AuthDb instance = AuthDb._init();
  static Database? _database;

  AuthDb._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('auth.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db , int version) async {
    await db.execute('''
      CREATE TABLE tokens (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        token TEXT NOT NULL,
        arrToken TEXT NOT NULL,
        userId INTEGER NOT NULL,
        name TEXT NOT NULL,
        userName TEXT NOT NULL,
        roleId INTEGER,
        roleName TEXT
      )
    ''');
  }
}
