import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class LearningLabel extends StatelessWidget {
  int point;
  int points;

  LearningLabel({@required this.point, this.points = 10});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 4.0,
          width: MediaQuery.of(context).size.width * this.point / this.points,
          color: GREEN_LIGHT,
        ),
      ],
    );
  }
}
