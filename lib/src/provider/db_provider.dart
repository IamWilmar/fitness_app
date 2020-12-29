import 'dart:io';
import 'package:fitness_app/src/models/log_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    //Path de donde almacenar la db
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'LogsDB.db');
    print(path);
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE Logs(
            id INTEGER PRIMARY KEY,
            exercise TEXT,
            reps INTEGER,
            sets INTEGER,
            datetime TEXT
          )
        ''');
    });
  }

  Future<int> nuevoLog(LogModel nuevoLog) async {
    final db = await database;
    final res = await db.insert('Logs', nuevoLog.toJson());
    print(res);
    //ID del ultimo registro
    return res;
  }

  Future<LogModel> getLogById(int id) async {
    final db = await database;
    final res = await db.query('Logs', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? LogModel.fromJson(res.first) : null;
  }

  Future<List<LogModel>> getAllLogs() async {
    final db = await database;
    final res = await db.query('Logs');
    return res.isNotEmpty ? res.map((l) => LogModel.fromJson(l)).toList() : [];
  }

  Future<List<LogModel>> getLogPerExercise(String exerciseType) async {
    final db = await database;
    final res = await db
        .query('Logs', where: "exercise = ?", whereArgs: [exerciseType]);
    return res.isNotEmpty ? res.map((l) => LogModel.fromJson(l)).toList() : [];
  }

  Future<int> updateLogs(LogModel newLog) async {
    final db = await database;
    final res = await db.update('Logs', newLog.toJson(),
        where: 'id = ?', whereArgs: [ newLog.id ]);
    return res;
  }

  Future<int> deleteLog(int id) async{
    final db = await database;
    final res = await db.delete('Logs', where: 'id = ?', whereArgs: [id]);
    return res;
  }


    Future<int> deleteAllLogs() async {
    final db = await database;
    final res = await db.delete('Logs');
    return res;
  }


}
