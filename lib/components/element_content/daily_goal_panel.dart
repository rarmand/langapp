import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class DailyGoalPanel extends StatelessWidget {
  final int number;

  List<DailyGoalValue> goals = [
    DailyGoalValue(value: 10),
    DailyGoalValue(value: 25),
    DailyGoalValue(value: 40),
    DailyGoalValue(value: 50),
  ];

// TODO: dorobić kółeczko ze strzałką
  DailyGoalPanel({@required this.number}) {
    goals.forEach((goal) {
      if (goal.value == this.number) goal.isChosen = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 20.0),
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: this.goals,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(BTN_RADIUS)),
        gradient: LinearGradient(colors: [GREEN_LIGHT, GREEN_DARK]),
        boxShadow: [
          BoxShadow(
            color: GRAY,
            offset: Offset(0, SHADOW_OFFSET),
            blurRadius: SHADOW_RADIUS,
          )
        ],
      ),
    );
  }
}

class DailyGoalValue extends StatelessWidget {
  final int value;
  bool isChosen;

  DailyGoalValue({@required this.value, this.isChosen = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      this.value.toString(),
      style: TextStyle(
        fontSize: 20.0,
        fontFamily: "Roboto",
        fontWeight: (this.isChosen ? FontWeight.bold : FontWeight.w400),
        color: WHITE,
      ),
    );
  }
}
