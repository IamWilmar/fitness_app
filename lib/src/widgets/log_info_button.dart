import 'package:fitness_app/src/models/log_model.dart';
import 'package:fitness_app/src/provider/log_provider.dart';
import 'package:fitness_app/src/provider/newlog_provider.dart';
import 'package:fitness_app/src/widgets/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogInfoWidget extends StatelessWidget {
  final LogModel log;
  final TextStyle exerciseFont = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 30.0,
  );
  final TextStyle dateTimeFont = TextStyle(
    color: Colors.white.withOpacity(0.3),
    fontWeight: FontWeight.bold,
    fontSize: 30.0,
  );
  LogInfoWidget(this.log);
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
      child: InkWell(
        onTap: () => actionsLog(context, log),
        child: LogCardContent(log),
      ),
    );
  }
}

void actionsLog(BuildContext context, LogModel log) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      final newLog = Provider.of<NewLogProvider>(context);
      final logProvider = Provider.of<LogProvider>(context, listen: true);
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        title: Text('Add a log'),
        content: SingleChildScrollView(
          child: Wrap(
            children: [
              Row(
                children: [
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Edit'),
                  ),
                  FlatButton(
                    onPressed: () {
                      logProvider.borrarLogPorId(log.id);
                      Navigator.of(context).pop();
                    },
                    child: Text('Delete'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

class LogCardContent extends StatelessWidget {
  LogCardContent(this.log);
  final LogModel log;
  final TextStyle exerciseFont = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 30.0,
  );
  final TextStyle dateTimeFont = TextStyle(
    color: Colors.white.withOpacity(0.3),
    fontWeight: FontWeight.bold,
    fontSize: 30.0,
  );
  final TextStyle setRepFont = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 18.0,
  );
  final TextStyle setRepProgress = TextStyle(
    color: Colors.grey[350],
    fontWeight: FontWeight.bold,
    fontSize: 12.0,
  );
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      child: GestureDetector(
        child: Container(
          padding: EdgeInsets.only(top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(log.exercise, style: exerciseFont),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("sets", style: setRepFont),
                  Text('${log.sets.toString()}/7', style: setRepProgress),
                ],
              ),
              ProgressBar(logval: log.sets, maxval: 7),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("reps", style: setRepFont),
                  Text('${log.reps.toString()}/30', style: setRepProgress),
                ],
              ),
              ProgressBar(logval: log.reps, maxval: 30),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Text(log.datetime, style: dateTimeFont),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
