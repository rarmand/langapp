import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class DailyGoalMarks extends StatelessWidget {
  List<Mark> goals = [
    Mark(isMarked: true),
    Mark(isMarked: false),
    Mark(isMarked: true),
    Mark(isMarked: false),
    Mark(isMarked: false),
    Mark(isMarked: true),
    Mark(isMarked: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: goals,
        ));
  }
}

class Mark extends StatelessWidget {
  final bool isMarked;

  Mark({@required this.isMarked});

  @override
  Widget build(BuildContext context) {
    Widget circle = new Container(
      width: 30.0,
      height: 30.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: (this.isMarked ? [GREEN_LIGHT, GREEN_LIGHT] : [GRAY, GRAY.withAlpha(200)]),
        ),
        boxShadow: [
          BoxShadow(
            color: BROWN_SHADOW_25,
            offset: Offset(0, 4),
            blurRadius: 12.0,
          ),
        ],
        shape: BoxShape.circle,
      ),
    );
    return Container(margin: EdgeInsets.all(4.0), child: circle);
  }
}
