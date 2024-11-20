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

Future<void> _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE tokens (
      id INTEGER PRIMARY KEY,
      name TEXT NOT NULL,
      userName TEXT NOT NULL,
      email_verified_at TEXT,
      role_id INTEGER,
      foto_profil TEXT,
      data_completion_step INTEGER,
      status_aktif INTEGER,
      token TEXT,
      remember_token_expired_at TEXT,
      arrToken TEXT
    );
  ''');

    await db.execute('''
    CREATE TABLE unit_kerja (
      id INTEGER PRIMARY KEY,
      nama_unit TEXT NOT NULL,
      jenis_karyawan INTEGER,
      user_id INTEGER,
      FOREIGN KEY (user_id) REFERENCES tokens (id)
    );
  ''');

    await db.execute('''
    CREATE TABLE roles (
      id INTEGER PRIMARY KEY,
      name TEXT NOT NULL,
      deskripsi TEXT,
      user_id INTEGER,
      FOREIGN KEY (user_id) REFERENCES tokens (id)
    );
  ''');
  }
}
