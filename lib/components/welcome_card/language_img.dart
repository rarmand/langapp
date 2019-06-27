import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:langapp/styles/colors.dart';

class LanguageImg extends StatelessWidget {
  final Widget flag = SvgPicture.asset('assets/flag_germany.svg');
  
  // TODO: flaga i nazwa jezyka do pobrania w konstruktorze

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 45),
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: 132,
              width: 132,
              decoration: BoxDecoration(
                color: WHITE,
                shape: BoxShape.circle,
              ),
            ),
            Transform.scale(
              scale: 1.5,
              child: this.flag,
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
