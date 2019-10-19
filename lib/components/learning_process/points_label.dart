import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:langapp/model/app_model.dart';
import 'package:langapp/styles/colors.dart';
import 'package:scoped_model/scoped_model.dart';

class PointsLabel extends StatelessWidget {
  final bool isSpeedTest;

  PointsLabel({this.isSpeedTest = false});

  @override
  Widget build(BuildContext context) {
    int points = ScopedModel.of<UserModel>(context, rebuildOnChange: true).processPoints;
    String iconPath = ScopedModel.of<UserModel>(context, rebuildOnChange: true).iconProcessPath;
    if(this.isSpeedTest) {
      points = ScopedModel.of<UserModel>(context, rebuildOnChange: true).revives;
    }

    Widget icon = SvgPicture.asset(
      iconPath,
      color: BROWN_DARK.withOpacity(0.5),
      width: 32.0,
    );
    if (icon == null) icon = Icon(Icons.account_circle);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          icon,
          const SizedBox(width: 4.0),
          Text(
            "$points",
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
