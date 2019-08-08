import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class Bubble extends StatelessWidget {
  final String title;
  final double radius;
  final double fontSize;

  Bubble({@required this.title, @required this.radius, @required this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        this.title,
        style: TextStyle(
          fontFamily: "Roboto",
          fontSize: this.fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
      height: this.radius * 2,
      width: this.radius * 2,
      decoration: BoxDecoration(
        color: WHITE,
        borderRadius: BorderRadius.all(
          Radius.circular(this.radius),
        ),
        boxShadow: [
          BoxShadow(
            color: BROWN_SHADOW_25,
            offset: Offset(0, SHADOW_OFFSET / 2),
            blurRadius: SHADOW_RADIUS,
          ),
        ],
      ),
    );
  }
}
