import 'package:fitness_app/src/widgets/floating_bar.dart';
import 'package:fitness_app/src/widgets/log_info_button.dart';
import 'package:flutter/material.dart';

class LogManagerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                LogInfoWidget(),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionBar(),
      ),
    );
  }
}
