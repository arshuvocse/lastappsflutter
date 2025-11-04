
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/user_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    String path = join(await getDatabasesPath(), 'app_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tblUser(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        email TEXT,
        password TEXT
      )
    ''');
  }

  Future<void> saveUser(User user) async {
    final db = await database;
    await db.insert(
      'tblUser',
      {'email': user.email, 'password': user.password},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
