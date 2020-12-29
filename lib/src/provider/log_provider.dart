import 'package:fitness_app/src/models/log_model.dart';
import 'package:fitness_app/src/provider/db_provider.dart';
import 'package:flutter/material.dart';

class LogProvider extends ChangeNotifier{
  List<LogModel> logList = [];

  newLog(String exercise, int reps, int sets, String datetime) async {
    final nuevoLog = new LogModel(exercise:  exercise, reps: reps, sets: sets, datetime: datetime);
    final id = await DBProvider.db.nuevoLog(nuevoLog);
    nuevoLog.id = id;
    this.logList.add(nuevoLog);
    notifyListeners();
  }

  cargarLogs() async {
    final logs = await DBProvider.db.getAllLogs();
    this.logList = [...logs];
    notifyListeners();
  }

  cargarLogsPorTipo(String exercise) async {
     final logs = await DBProvider.db.getLogPerExercise(exercise);
    this.logList = [...logs];
    notifyListeners();
  }

  borrarTodos() async {
    await DBProvider.db.deleteAllLogs();
    this.logList = [];
    notifyListeners();
  }

  borrarLogPorId(int id) async {
    await DBProvider.db.deleteLog(id);
    this.cargarLogs();
    notifyListeners();
  }

}