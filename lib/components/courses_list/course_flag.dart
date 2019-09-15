import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:langapp/styles/colors.dart';

class CourseFlag extends StatelessWidget {
  Widget _flagIcon;

  CourseFlag({@required String language}) {
    // TODO: może da się lepiej
    String path = 'poland';
    if (language == "french")
      path = 'france';
    else if (language == "german") path = "germany";

    this._flagIcon = SvgPicture.asset(
      'assets/flags/$path.svg',
      width: 58.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          height: 62,
          width: 62,
          decoration: BoxDecoration(
            color: WHITE,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurRadius: 16.0,
                color: BROWN_SHADOW_25,
              ),
            ],
          ),
        ),
        this._flagIcon,
      ],
    );
  }
}
