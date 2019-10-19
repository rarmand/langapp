import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ProfileInfoLine extends StatelessWidget {
  final String text;
  final String value;

  ProfileInfoLine({@required this.text, @required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 12, 0, 12),
      child: Row(
        children: <Widget>[
          Container(
            width: 140.0,
            child: Text(this.text),
          ),
          Flexible(
            child: Container(
              child: Text(
                this.value,
                overflow: TextOverflow.fade,
                softWrap: true,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
