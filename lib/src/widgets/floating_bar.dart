import 'package:flutter/material.dart';

class FloatingActionBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 10.0,
      children: [
        FloatingActionItem(Icons.add),
        FloatingActionItem(Icons.edit),
        FloatingActionItem(Icons.delete),
      ],
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
        child: Icon(iconItem, color: Colors.white,),
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
      onPressed: () {},
    );
  }
}
