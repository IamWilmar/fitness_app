// To parse this JSON data, do
//
//     final logModel = logModelFromJson(jsonString);

import 'dart:convert';
import 'package:meta/meta.dart';

LogModel logModelFromJson(String str) => LogModel.fromJson(json.decode(str));
String logModelToJson(LogModel data) => json.encode(data.toJson());

class LogModel {
    LogModel({
        this.id,
        @required this.exercise,
        this.reps,
        this.sets,
        this.datetime,
    });

    int id;
    String exercise;
    int reps;
    int sets;
    String datetime;

    factory LogModel.fromJson(Map<String, dynamic> json) => LogModel(
        id: json["id"],
        exercise: json["exercise"],
        reps: json["reps"],
        sets: json["sets"],
        datetime: json["datetime"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "exercise": exercise,
        "reps": reps,
        "sets": sets,
        "datetime": datetime,
    };
}
