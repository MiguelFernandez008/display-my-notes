import 'dart:async';
import 'package:display_my_notes/models/note.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseController {
  static final DatabaseController _instance = DatabaseController._internal();
  final String _databaseName = 'display_my_notes';
  final String _tableName = 'notes';
  Future<Database> database;
  int _lastIndex = 0;

  factory DatabaseController() {
    return _instance;
  }

  DatabaseController._internal();

  String _dataBaseName() {
    return _databaseName + ".db";
  }

  void createDatabase() async {
    if(database != null) return;
    database = openDatabase(join(await getDatabasesPath(), _dataBaseName()),
        onCreate: (db, version) {
      return db.execute("CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, contenido TEXT, fecha TEXT)");
    }, version: 1);
  }

  Future<void> insertNote(Note note) async {
    final Database db = await database;
    _lastIndex = await db.insert(_tableName, note.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Note>> getNotes() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(_tableName);
    return List.generate(maps.length, (index) {
      return Note(
        id: maps[index]['id'],
        contenido: maps[index]['contenido'],
        fecha: maps[index]['fecha'],
      );
    });
  }

  Future<void> updateNote() async {
    // TODO: Add update later
  }

  Future<void> deleteNote(int id) async {
    final Database db = await database;
    await db.delete(_tableName, where: "id = ?", whereArgs: [id]);
  }

  Future<int> getNumberRows() async {
    final Database db = await database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $_tableName'));
  }

  int getNextIndex() {
    return _lastIndex + 1;
  }
}
