import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:langapp/styles/colors.dart';

class DailyGoalImg extends StatelessWidget {
  final Widget roundup = SvgPicture.asset('assets/intro/round_up.svg');
  final int timestamp;
  final Color backgroundColor;
  final Color textColor;

  DailyGoalImg({@required int this.timestamp, this.backgroundColor = GREEN_DARK, this.textColor = WHITE});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 36),
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: 130,
              alignment: Alignment.center,
              child: Text(
                this.timestamp.toString(),
                style: TextStyle(
                  color: this.textColor,
                  fontSize: 56,
                  fontFamily: "Roboto",
                  shadows: [
                    Shadow(
                      color: WHITE,
                      offset: Offset(0, SHADOW_OFFSET / 2),
                      blurRadius: 16.0,
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 50.0,
                    color: this.backgroundColor,
                  ),
                ],
              ),
            ),
            Transform.scale(
              scale: 0.9,
              child: this.roundup,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
