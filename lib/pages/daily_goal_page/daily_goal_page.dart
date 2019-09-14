import 'package:flutter/material.dart';
import 'package:langapp/components/carousel/carousel.dart';
import 'package:langapp/components/frame/welcome_frame.dart';
import 'package:langapp/components/rich_text/rich_text_widget.dart';
import 'package:langapp/components/welcome_card/daily_goal_img.dart';
import 'package:langapp/components/welcome_card/welcome_card.dart';
import 'package:langapp/model/app_model.dart';
import 'package:langapp/styles/colors.dart';
import 'package:scoped_model/scoped_model.dart';

class DailyGoalPage extends StatelessWidget {
  final List<int> _timestamps = [10, 25, 40, 50];

  final List<TextSpan> _title = <TextSpan>[
    TextSpan(
      text: "Choose your\n",
      style: TextStyle(
        color: BROWN_DARK,
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    ),
    TextSpan(
      text: "daily goal",
      style: TextStyle(
        color: GREEN_LIGHT,
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> dailyGoalItems = List.generate(
      this._timestamps.length,
      (int index) {
        return WelcomeCard(
          title: "words per day",
          img: DailyGoalImg(
            timestamp: this._timestamps[index],
          ),
          onTap: () {
            ScopedModel.of<UserModel>(context).setDailyGoal(
              dailyGoal: this._timestamps[index],
            );
            Navigator.pushNamed(context, "/choose_language");
          },
        );
      },
    );

    return WelcomeFrame(
      onPressedNext: () => Navigator.pushNamed(context, "/"),
      onPressedBack: () => Navigator.pop(context),
      title: RichTextWidget(textLines: this._title),
      child: Container(
        margin: EdgeInsets.only(top: 60.0),
        child: Carousel(items: dailyGoalItems),
      ),
    );
  }
}
