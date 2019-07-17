import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class DailyGoalMarks extends StatelessWidget {
  // TODO: czy dodawać cień do kulek? NIEEE albo coś innego do odznaczania
  // czy nie zmienić całkiem stylu
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
          colors: (this.isMarked ? [GREEN_DARK, GREEN_LIGHT] : [GRAY.withAlpha(120), GRAY]),
        ),
        shape: BoxShape.circle,
      ),
    );
    return Container(margin: EdgeInsets.all(4.0), child: circle);
  }
}
