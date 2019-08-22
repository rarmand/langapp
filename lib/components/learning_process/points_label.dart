import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:langapp/styles/colors.dart';

class PointsLabel extends StatelessWidget {
  final int points;
  final String iconPath;
  Widget icon;

  PointsLabel({@required this.points, @required this.iconPath}) {
    this.icon = SvgPicture.asset(
      this.iconPath,
      color: BROWN_DARK.withOpacity(0.5),
      width: 32.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          this.icon,
          SizedBox(width: 4.0),
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
