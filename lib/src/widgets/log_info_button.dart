import 'package:fitness_app/src/models/log_model.dart';
import 'package:flutter/material.dart';

class LogInfoWidget extends StatelessWidget {
    final LogModel log;
  const LogInfoWidget(this.log);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: double.infinity,
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xFF7075FF),
            Color(0xFF999CFF),
          ],
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(0xFF858585).withOpacity(0.3),
            offset: Offset(4, 6),
            blurRadius: (10.0),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(log.exercise),
          Text(log.reps.toString()),
          Text(log.sets.toString()),
          Text(log.datetime),
        ],
      ),
    );
  }
}
