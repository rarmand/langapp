import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class LearningLabel extends StatelessWidget {
  int point;

  LearningLabel({@required this.point});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4.0,
      width: MediaQuery.of(context).size.width * this.point / 5,
      color: GREEN_LIGHT,
    );
  }
}
