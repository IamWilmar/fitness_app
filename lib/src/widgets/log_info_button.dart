import 'package:flutter/material.dart';

class LogInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LogInfoBackground();
  }
}

class LogInfoBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20.0),
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
    );
  }
}
