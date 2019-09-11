import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:langapp/styles/colors.dart';

class CourseType extends StatelessWidget {
  final Widget tagIcon = SvgPicture.asset(
    'assets/course/tag.svg',
    color: BROWN_SHADOW_25.withAlpha(128),
  );
  final String type;

  CourseType({this.type = "vocabulary"});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          this.tagIcon,
          SizedBox(width: 8),
          Text(
            this.type,
            style: TextStyle(
              color: BROWN_SHADOW_25.withAlpha(128),
              fontWeight: FontWeight.w100,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
