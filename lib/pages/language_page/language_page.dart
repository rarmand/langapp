import 'package:flutter/material.dart';
import 'package:langapp/components/carousel/carousel.dart';
import 'package:langapp/components/frame/welcome_frame.dart';
import 'package:langapp/components/rich_text/rich_text_widget.dart';
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
      title: "French",
      img: LanguageImg(flagImgPath: "assets/flags/france.svg"),
      route: '/choose_daily_goal',
    ),
  ];

  final List<TextSpan> title = <TextSpan>[
    TextSpan(
      text: "Choose ",
      style: TextStyle(
        color: BROWN_DARK,
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    ),
    TextSpan(
      text: "a language\n",
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
  ];

  @override
  Widget build(BuildContext context) {
    return WelcomeFrame(
      onPressedNext: () => Navigator.pushNamed(context, "/choose_daily_goal"),
      onPressedBack: () => Navigator.pop(context),
      title: DefaultTextStyle(
        style: Theme.of(context).textTheme.title,
        child: RichTextWidget(textLines: this.title),
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
