import 'package:flutter/material.dart';
import 'package:langapp/components/carousel/carousel.dart';
import 'package:langapp/components/frame/welcome_frame.dart';
import 'package:langapp/components/rich_text/rich_text_widget.dart';
import 'package:langapp/components/welcome_card/daily_goal_img.dart';
import 'package:langapp/components/welcome_card/welcome_card.dart';
import 'package:langapp/styles/colors.dart';

class DailyGoalPage extends StatelessWidget {
  List<Widget> dailyGoalItems = [
    WelcomeCard(
      title: "words per day",
      img: DailyGoalImg(
        timestamp: 10,
      ),
      route: "/",
    ),
    WelcomeCard(
      title: "words per day",
      img: DailyGoalImg(
        timestamp: 25,
      ),
      route: "/",
    ),
    WelcomeCard(
      title: "words per day",
      img: DailyGoalImg(
        timestamp: 40,
      ),
      route: "/",
    ),
    WelcomeCard(
      title: "words per day",
      img: DailyGoalImg(
        timestamp: 50,
      ),
      route: "/",
    ),
  ];

  final List<TextSpan> title = <TextSpan>[
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
    return WelcomeFrame(
      onPressedNext: () => Navigator.pushNamed(context, "/"),
      onPressedBack: () => Navigator.pop(context),
      title: RichTextWidget(textLines: this.title),
      child: Container(
        margin: EdgeInsets.only(top: 60.0),
        child: Carousel(items: this.dailyGoalItems),
      ),
    );
  }
}
