import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class DailyGoalPanel extends StatelessWidget {
  // TODO: trzeba jeszcze pomanewrować, jak złączyć stany isChosen panelu do isChosen jednej wartości
  int isChosen;

  List<DailyGoalValue> goals = [
    DailyGoalValue(value: 10, isChosen: true),
    DailyGoalValue(value: 25),
    DailyGoalValue(value: 40),
    DailyGoalValue(value: 50),
  ];

  DailyGoalPanel({@required this.isChosen});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 20.0),
      padding: EdgeInsets.symmetric(vertical: 15.0),
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
