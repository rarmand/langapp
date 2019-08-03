import 'package:flutter/material.dart';
import 'package:langapp/components/frame/welcome_frame.dart';
import 'package:langapp/components/welcome_card/daily_goal_img.dart';
import 'package:langapp/components/welcome_card/welcome_card.dart';
import 'package:langapp/styles/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';

// works only after registration
class DailyGoalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WelcomeFrame(
      onPressedNext: () => Navigator.pushNamed(context, "/"),
      onPressedBack: () => Navigator.pop(context),
      title: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
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
          ],
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(top: 30.0),
        child: CarouselSlider(
          height: 300.0,
          viewportFraction: 0.7,
          enlargeCenterPage: true,
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return WelcomeCard(
                  title: "words per day",
                  img: DailyGoalImg(),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
