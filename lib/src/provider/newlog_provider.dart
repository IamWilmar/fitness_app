import 'package:flutter/material.dart';

class NewLogProvider extends ChangeNotifier{
  String _newName;
  String get newName => this._newName;
  set newName(String newName) {
    this._newName = newName;
    notifyListeners();
  }

  int _newReps;
  int get newReps => this._newReps;
  set newReps(int newReps) {
    this._newReps = newReps;
    notifyListeners();
  }

  int _newSets;
  int get newSets => this._newSets;
  set newSets(int newSets) {
    this._newSets = newSets;
    notifyListeners();
  }

}