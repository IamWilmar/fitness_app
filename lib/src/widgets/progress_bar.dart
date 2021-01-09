import 'package:fitness_app/src/models/log_model.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final int maxval;
  final int logval;
  const ProgressBar({@required this.maxval, @required this.logval});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 10.0,
      child: CustomPaint(
        painter: _LinearProgress(maxValue: maxval, currentValue: logval),
      ),
    );
  }
}

class _LinearProgress extends CustomPainter {
  final maxValue;
  final currentValue;
  _LinearProgress({@required this.maxValue, @required this.currentValue});
  @override
  void paint(Canvas canvas, Size size) {
    final percentage =
        currentValue <= maxValue ? (currentValue / maxValue) * 100 : 100;

    //Limit Bar
    final paint = new Paint()
      ..strokeWidth = 10
      ..color = Colors.white.withOpacity(0.3)
      ..style = PaintingStyle.stroke;

    Offset punto1 = new Offset(0, size.height / 2);
    Offset punto2 = new Offset(size.width, size.height / 2);
    canvas.drawLine(punto1, punto2, paint);

    //Progress Bar

    final paintProgress = new Paint()
      ..strokeWidth = 10
      ..color = Colors.white
      ..style = PaintingStyle.stroke;

    double progress = size.width * (percentage / 100);
    Offset puntoP1 = new Offset(0, size.height / 2);
    Offset puntoP2 = new Offset(progress, size.height / 2);
    canvas.drawLine(puntoP1, puntoP2, paintProgress);
  }

  @override
  bool shouldRepaint(_LinearProgress oldDelegate) => true;
}
