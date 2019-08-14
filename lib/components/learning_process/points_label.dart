import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class PointsLabel extends StatelessWidget {
  final int points;

  PointsLabel({@required this.points});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.public,
            color: BROWN_DARK.withOpacity(0.5),
          ),
          SizedBox(width: 8.0),
          Text(
            this.points.toString(),
            style: TextStyle(
              fontFamily: "Roboto",
              fontSize: 16.0,
              color: BROWN_DARK.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
