import 'package:flutter/cupertino.dart';
import 'package:langapp/components/appbar_upper/appbar_upper.dart';
import 'package:langapp/styles/colors.dart';

class HomePage extends StatelessWidget {
  final int points = 2533;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          AppBarUpper(title: "Home"),
          // swipe
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  // text
                  child: Text(
                    this.points.toString() + "\nyour points",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                      color: WHITE,
                    ),
                  ),
                  // styled text
                  height: 152.0,
                  width: 160.0,
                  margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(BTN_RADIUS)),
                    gradient: LinearGradient(
                      colors: <Color>[
                        BROWN_LIGHT,
                        BROWN_DARK,
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: BROWN_LIGHT,
                        blurRadius: 8.0,
                      ),
                    ],
                  ),
                ),
                // description
                Text("Choose a course, repeat material and win more points."),
                // buttons
                Row(
                  children: <Widget>[],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
