import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:langapp/styles/colors.dart';

class DailyGoalImg extends StatelessWidget {
  final Widget roundup = SvgPicture.asset('assets/intro/round_up.svg');
  // TODO: timestamp do pobrania w konstruktorze
  // każdy inny zależnie od ilości możliwości
  final String timestamp = '10';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 35),
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: 130,
              alignment: Alignment.center,
              child: Text(
                this.timestamp,
                style: TextStyle(
                  color: WHITE,
                  fontSize: 48,
                  fontFamily: "Roboto",
                ),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 50.0,
                    color: GREEN_DARK,
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
