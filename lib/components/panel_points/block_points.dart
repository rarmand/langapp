import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class BlockPoints extends StatelessWidget {
  final int points = 2533;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        this.points.toString() + "\nyour points",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
          height: 1.25,
          color: WHITE,
        ),
      ),
      height: 152.0,
      width: 160.0,
      margin: EdgeInsets.only(top: 40.0, bottom: 40.0),
      // TODO: cieniowanie klocka?
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(BTN_RADIUS)),
        gradient: LinearGradient(
          colors: <Color>[
            BROWN_LIGHT,
            ORANGE,
          ],
        ),
      ),
    );
  }
}
