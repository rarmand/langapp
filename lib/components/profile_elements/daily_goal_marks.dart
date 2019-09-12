import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class DailyGoalMarks extends StatelessWidget {
  List<Mark> _goals = [];

  DailyGoalMarks({@required List<bool> dailyGoalData}) {
    dailyGoalData.forEach((element) => this._goals.add(Mark(isMarked: element)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Wrap(
        runSpacing: 4.0,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.spaceBetween,
        children: this._goals,
      ),
    );
  }
}

class Mark extends StatelessWidget {
  final bool isMarked;

  Mark({@required this.isMarked});

  @override
  Widget build(BuildContext context) {
    Widget circle = new Container(
      width: 32.0,
      height: 32.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: (this.isMarked ? [GREEN_DARK, GREEN_LIGHT] : [GRAY.withAlpha(120), GRAY]),
        ),
        shape: BoxShape.circle,
        border: Border.all(color: BROWN_SHADOW_25, width: 2),
      ),
    );

    return Container(
      margin: EdgeInsets.all(4.0),
      child: circle,
    );
  }
}
