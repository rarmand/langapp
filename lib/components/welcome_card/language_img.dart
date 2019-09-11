import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:langapp/styles/colors.dart';

class LanguageImg extends StatelessWidget {
  Widget flag;

  LanguageImg({@required String flagImgPath}) {
    flag = SvgPicture.asset(
      flagImgPath,
      width: 83,
      height: 83,
    );
  }

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
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12.0,
                    color: BROWN_SHADOW_25,
                  ),
                ],
              ),
            ),
            Transform.scale(
              scale: 1.5,
              child: this.flag,
            ),
          ],
        ),
        const SizedBox(
          height: 36,
        ),
      ],
    );
  }
}
