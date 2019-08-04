import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class ButtonCourse extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function onPressed;

  ButtonCourse({@required this.name, @required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      icon: Icon(
        this.icon,
        color: BROWN_LIGHT,
      ),
      label: Text(
        this.name,
        style: TextStyle(
          fontSize: 14.0,
          color: BROWN_DARK,
        ),
      ),
      onPressed: this.onPressed,
    );
  }
}
