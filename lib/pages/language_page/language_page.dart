import 'package:flutter/material.dart';
import 'package:langapp/components/frame/welcome_frame.dart';
import 'package:langapp/components/welcome_card/language_img.dart';
import 'package:langapp/components/welcome_card/welcome_card.dart';
import 'package:langapp/styles/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';

class LanguagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WelcomeFrame(
      // TODO: do wycięcia ?
      // powinien byc ten NEXT button

      onPressedNext: () => Navigator.pushNamed(context, "/choose_daily_goal"),
      onPressedBack: () => Navigator.pop(context),

      title: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(
              text: "Choose ",
              style: TextStyle(
                color: BROWN_DARK,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            TextSpan(
              text: "language\n",
              style: TextStyle(
                color: GREEN_LIGHT,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            TextSpan(
              text: "you want to learn",
              style: TextStyle(
                color: BROWN_DARK,
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
                  // TODO: kilka jezyków do wyboru z bazy danych
                  title: "German",
                  img: LanguageImg(),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
