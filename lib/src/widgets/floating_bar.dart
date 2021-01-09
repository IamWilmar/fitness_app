import 'package:fitness_app/src/models/log_model.dart';
import 'package:fitness_app/src/provider/db_provider.dart';
import 'package:fitness_app/src/provider/log_provider.dart';
import 'package:fitness_app/src/provider/newlog_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class FloatingActionBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        direction: Axis.vertical,
        spacing: 30.0,
        children: [
          FloatingActionItem(Icons.add),
          FloatingActionItem(Icons.edit),
          FloatingActionItem(Icons.delete),
        ],
      ),
    );
  }
}

class FloatingActionItem extends StatelessWidget {
  final IconData iconItem;
  const FloatingActionItem(this.iconItem);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xFF777BA6),
      child: Container(
        width: 60,
        height: 60,
        child: Icon(
          iconItem,
          color: Colors.white,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xFF7075FF),
              Color(0xFF999CFF),
            ],
          ),
        ),
      ),
      onPressed: () {
        if (iconItem == Icons.add) {
          addLog(context);
        }
      },
    );
  }
}

void addLog(BuildContext context) {
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
                CustomTextField(hint: 'exercise type', inputType: TextInputType.text),
                CustomTextField(hint: 'reps', inputType: TextInputType.number),
                CustomTextField(hint: 'sets', inputType: TextInputType.number),
                Row(
                  children: [
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('cancel'),
                    ),
                    FlatButton(
                      onPressed: () {
                        final date = DateTime.now();
                        final DateFormat formatter = DateFormat('yyyy-MM-dd');
                        final String formatted = formatter.format(date);
                        logProvider.newLog(newLog.newName, newLog.newReps, newLog.newSets, formatted);
                        Navigator.of(context).pop();
                      },
                      child: Text('save'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      });
}

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextInputType inputType;
  const CustomTextField({@required this.hint, @required this.inputType});
  @override
  Widget build(BuildContext context) {
    final newLog = Provider.of<NewLogProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.symmetric(vertical: 12.0),
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          hintStyle: TextStyle(fontWeight: FontWeight.bold),
          contentPadding: EdgeInsets.only(left: 10.0),
        ),
        keyboardType: inputType,
        onChanged: (val) {
          if(hint=="exercise type") newLog.newName = val;
          
          if(hint == "reps") newLog.newReps = int.parse(val);
          
          if(hint == "sets") newLog.newSets = int.parse(val);

        },
      ),
    );
  }
}
