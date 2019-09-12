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
          // TODO: tu może być problem: zapytać
          Container(
            width: MediaQuery.of(context).size.width / 3,
            child: Text(
              this.text,
              style: TextStyle(),
            ),
          ),
          Container(
            // TODO: blokada na długość tekstu albo jakiś WrAP
            width: MediaQuery.of(context).size.width / 3,
            child: Text(
              this.value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
