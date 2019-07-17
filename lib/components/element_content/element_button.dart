import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class ElementButton extends StatelessWidget {
  final String name;
  final IconData buttonIcon;

  ElementButton({@required this.name, @required this.buttonIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0, top: 15.0),
      child: Row(
        children: <Widget>[
          Icon(this.buttonIcon, color: GREEN_LIGHT),
          SizedBox(width: 10.0),
          Text(
            this.name,
            style: TextStyle(
              color: GREEN_LIGHT,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
