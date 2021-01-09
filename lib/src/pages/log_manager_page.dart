import 'package:fitness_app/src/provider/log_provider.dart';
import 'package:fitness_app/src/widgets/floating_bar.dart';
import 'package:fitness_app/src/widgets/log_info_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogManagerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logListProvider = Provider.of<LogProvider>(context);
    final logs = logListProvider.logList;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: [
          DataVisual(),
          Expanded(
            child: Container(
              //margin: EdgeInsets.only(right:90.0),
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll){
                  overscroll.disallowGlow();
                  return;
                },
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: logListProvider.logList.length,
                  itemBuilder: (_, i) => LogInfoWidget(logs[i]),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionItem(Icons.add),
    );
  }
}

class DataVisual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 16.0, bottom: 20.0),
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        gradient: LinearGradient(colors: [
          Color(0xFF5E5E63),
          Color(0xFF586663),
        ]),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(0xFF858585).withOpacity(0.3),
            offset: Offset(4, 6),
            blurRadius: (10.0),
          ),
        ],
      ),
    );
  }
}
