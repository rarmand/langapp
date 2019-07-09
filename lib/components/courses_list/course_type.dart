import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:langapp/styles/colors.dart';

class CourseType extends StatelessWidget {
  final Widget tagIcon = SvgPicture.asset(
    'assets/course/tag.svg',
    color: WHITE,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          this.tagIcon,
          SizedBox(width: 8),
          Text(
            "type",
            style: TextStyle(color: WHITE),
          ),
        ],
      ),
    );
  }
}
