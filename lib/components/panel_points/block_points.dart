import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class BlockPoints extends StatelessWidget {
  final int points;

  BlockPoints({@required this.points});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Achieved points:\n",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: WHITE,
            ),
          ),
          Text(
            this.points.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w500,
              fontFamily: "Roboto",
              color: WHITE,
            ),
          ),
        ],
      ),
      height: 152.0,
      width: 200.0,
      margin: EdgeInsets.only(top: 40.0, bottom: 40.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(BTN_RADIUS)),
        gradient: LinearGradient(
          colors: <Color>[BROWN_LIGHT, BROWN_DARK],
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
