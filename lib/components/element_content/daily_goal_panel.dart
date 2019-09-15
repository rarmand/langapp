import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:langapp/model/app_model.dart';
import 'package:langapp/styles/colors.dart';
import 'package:scoped_model/scoped_model.dart';

class DailyGoalPanel extends StatefulWidget {
  @override
  _DailyGoalPanelState createState() => _DailyGoalPanelState();
}

class _DailyGoalPanelState extends State<DailyGoalPanel> {
  List<int> _goalsNumbers = [10, 25, 40, 50];

  void _onDailyGoalChoose(int value) {
    ScopedModel.of<UserModel>(context).setDailyGoal(dailyGoal: value);
    Firestore.instance
        .collection("users")
        .document(ScopedModel.of<UserModel>(context).userId)
        .updateData({"daily_goal": value});
  }

  @override
  Widget build(BuildContext context) {
    var chosenGoal = ScopedModel.of<UserModel>(context, rebuildOnChange: true).dailyGoal;

    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: this
            ._goalsNumbers
            .map((goal) => DailyGoalValue(
                  value: goal,
                  onChoose: this._onDailyGoalChoose,
                  isChosen: goal == chosenGoal,
                ))
            .toList(),
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
  final Function onChoose;
  final bool isChosen;

  DailyGoalValue({@required this.value, @required this.onChoose, this.isChosen = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => this.onChoose(this.value),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Text(
          this.value.toString(),
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: "Roboto",
            fontWeight: (this.isChosen ? FontWeight.bold : FontWeight.w400),
            color: WHITE,
          ),
        ),
      ),
    );
  }
}
