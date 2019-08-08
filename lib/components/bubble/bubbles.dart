import 'package:flutter/material.dart';
import 'package:langapp/components/bubble/bubble.dart';

class Bubbles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Bubble(
            title: "3",
            radius: 60.0,
            fontSize: 32.0,
          ),
          SizedBox(height: 20.0),
          Bubble(
            title: "2",
            radius: 45.0,
            fontSize: 28.0,
          ),
          SizedBox(height: 20.0),
          Bubble(
            title: "1",
            radius: 30.0,
            fontSize: 22.0,
          ),
        ],
      ),
    );
  }
}
