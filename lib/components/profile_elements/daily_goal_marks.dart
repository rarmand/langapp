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
      child: Wrap(
        runSpacing: 4.0,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.spaceBetween,
        children: goals,
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
      // TODO: może ustawić zmienny rozmiar kółeczek
      width: 28.0,
      height: 28.0,
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
