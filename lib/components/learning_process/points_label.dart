import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:langapp/styles/colors.dart';

class PointsLabel extends StatelessWidget {
  final int points;
  final String iconPath;
  Widget _icon;

  PointsLabel({@required this.points, @required this.iconPath}) {
    this._icon = SvgPicture.asset(
      this.iconPath,
      color: BROWN_DARK.withOpacity(0.5),
      width: 32.0,
    );
    if (this._icon == null) this._icon = Icon(Icons.account_circle);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          this._icon,
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
