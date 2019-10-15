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
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 4.0,
          width: (this.points == 0
              ? MediaQuery.of(context).size.width
              : MediaQuery.of(context).size.width * this.point / this.points),
          color: GREEN_LIGHT,
        ),
      ],
    );
  }
}
