import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class CourseBox extends StatelessWidget {
  final int index;

  CourseBox({this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 176,
      margin: EdgeInsets.fromLTRB(32, 8, 32, 8),
      decoration: BoxDecoration(
        color: GREEN_LIGHT,
        boxShadow: [
          BoxShadow(
            color: BROWN_SHADOW_25,
            offset: Offset(0, SHADOW_OFFSET),
            blurRadius: SHADOW_RADIUS,
          )
        ],
      ),
      child: Column(
        children: [
          Text("English A1"),
          Text("grammar"),
          Text("Place for icons"),
        ],
      ),
    );
  }
}
