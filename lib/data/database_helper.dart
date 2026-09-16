import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '/models/task.dart';

class DatabaseHelper {
  // Singleton
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  // Lấy database
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDB('todo.db');

    return _database!;
  }

  // Khởi tạo database
  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  // Tạo bảng
  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tasks (
         id INTEGER PRIMARY KEY AUTOINCREMENT,
         title TEXT NOT NULL,
         color INTEGER,
         dueAt TEXT,
         place TEXT,
         level REAL NOT NULL,
         status REAL NOT NULL
      )
    ''');
  }

  // =========================
  // CREATE
  // =========================

  Future<int> insertTask(Task task) async {
    final db = await database;

    return await db.insert('tasks', task.toMap());
  }

  // =========================
  // READ
  // =========================

  // Lấy tất cả task
  Future<List<Map<String, dynamic>>> getTasks() async {
    final db = await database;

    return await db.query('tasks', orderBy: 'id DESC');
  }

  // Lấy task theo id
  Future<Map<String, dynamic>?> getTaskById(int id) async {
    final db = await database;

    final result = await db.query('tasks', where: 'id = ?', whereArgs: [id]);

    if (result.isNotEmpty) {
      return result.first;
    }

    return null;
  }

  // Lấy task theo status
  Future<List<Map<String, dynamic>>> getTasksByStatus(String status) async {
    final db = await database;

    return await db.query(
      'tasks',
      where: 'status = ?',
      whereArgs: [status],
      orderBy: 'id DESC',
    );
  }

  // Tìm task theo title
  Future<List<Map<String, dynamic>>> searchTasks(String keyword) async {
    final db = await database;

    return await db.query(
      'tasks',
      where: 'title LIKE ?',
      whereArgs: ['%$keyword%'],
      orderBy: 'id DESC',
    );
  }

  // =========================
  // UPDATE
  // =========================

  Future<int> updateTask(int id, Map<String, dynamic> task) async {
    final db = await database;

    return await db.update('tasks', task, where: 'id = ?', whereArgs: [id]);
  }

  // =========================
  // DELETE
  // =========================

  Future<int> deleteTask(int id) async {
    final db = await database;

    return await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }

  // Xóa tất cả task
  Future<int> deleteAllTasks() async {
    final db = await database;

    return await db.delete('tasks');
  }

  // =========================
  // DATABASE
  // =========================

  // Đóng database
  Future<void> close() async {
    final db = await database;

    await db.close();

    _database = null;
  }
}
