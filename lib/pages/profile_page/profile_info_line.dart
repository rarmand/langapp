import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ProfileInfoLine extends StatelessWidget {
  final String name;
  final String data;

  ProfileInfoLine({@required this.name, @required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 3,
            child: Text(
              this.name + ":",
              style: TextStyle(),
            ),
          ),
          Container(
            // TODO: blokada na długość tekstu albo jakiś WrAP
            width: MediaQuery.of(context).size.width / 2,
            child: Text(
              this.data,
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
