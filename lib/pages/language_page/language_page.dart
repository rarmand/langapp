import 'package:flutter/material.dart';
import 'package:langapp/components/carousel/carousel.dart';
import 'package:langapp/components/frame/welcome_frame.dart';
import 'package:langapp/components/welcome_card/language_img.dart';
import 'package:langapp/components/welcome_card/welcome_card.dart';
import 'package:langapp/styles/colors.dart';

class LanguagePage extends StatelessWidget {
  final List<WelcomeCard> languageItems = [
    WelcomeCard(
      title: "German",
      img: LanguageImg(flagImgPath: "assets/flags/germany.svg"),
      route: '/choose_daily_goal',
    ),
    WelcomeCard(
      title: "English",
      img: LanguageImg(flagImgPath: "assets/flags/united_kingdom.svg"),
      route: '/choose_daily_goal',
    ),
    WelcomeCard(
      title: "Polish",
      img: LanguageImg(flagImgPath: "assets/flags/poland.svg"),
      route: '/choose_daily_goal',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return WelcomeFrame(
      // TODO: do wycięcia ?
      // powinien byc ten NEXT button

      onPressedNext: () => Navigator.pushNamed(context, "/choose_daily_goal"),
      onPressedBack: () => Navigator.pop(context),

      // TODO: problem z czcionką
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
        margin: EdgeInsets.only(top: 60.0),
        child: Carousel(
          items: languageItems,
        ),
      ),
    );
  }
}
