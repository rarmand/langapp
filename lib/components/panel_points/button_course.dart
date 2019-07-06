import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class ButtonCourse extends StatelessWidget {
  final String name;
  final IconData icon;

  ButtonCourse({@required this.name, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          this.icon,
          color: BROWN_LIGHT,
        ),
        const SizedBox(width: 5),
        Text(
          this.name,
          style: TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
}
