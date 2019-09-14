import 'package:flutter/material.dart';
import 'package:langapp/components/carousel/carousel.dart';
import 'package:langapp/components/frame/welcome_frame.dart';
import 'package:langapp/components/rich_text/rich_text_widget.dart';
import 'package:langapp/components/welcome_card/language_img.dart';
import 'package:langapp/components/welcome_card/welcome_card.dart';
import 'package:langapp/model/app_model.dart';
import 'package:langapp/styles/colors.dart';
import 'package:scoped_model/scoped_model.dart';

class LanguagePage extends StatelessWidget {
  final List<Map> _languages = [
    {
      'language': 'German',
      'imgPath': "assets/flags/germany.svg",
    },
    {
      'language': 'French',
      'imgPath': "assets/flags/france.svg",
    },
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
    List<Widget> languageItems = List.generate(
      this._languages.length,
      (int index) {
        return WelcomeCard(
          title: this._languages[index]['language'],
          img: LanguageImg(flagImgPath: this._languages[index]['imgPath']),
          onTap: () {
            ScopedModel.of<UserModel>(context).setLanguage(
              language: this._languages[index]['language'],
            );
            Navigator.pushNamed(context, "/choose_new_course");
          },
        );
      },
    );

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
