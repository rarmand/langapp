import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:langapp/styles/colors.dart';

class CourseFlag extends StatelessWidget {
  final Widget flagIcon = SvgPicture.asset('assets/flags/germany.svg');

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
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
        Transform.scale(
          scale: 0.7,
          child: this.flagIcon,
        ),
      ],
    );
  }
}
