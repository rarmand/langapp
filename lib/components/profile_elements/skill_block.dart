import 'package:flutter/material.dart';
import 'package:langapp/components/input_field/small_input_field.dart';
import 'package:langapp/styles/colors.dart';

// TODO: ustalona z góry pula pktów, którą można rozdzielić między bloczki
class SkillBlock extends StatelessWidget {
  final bool isChosen;
  final String title;
  final String subtitle;
  final bool editMode;
  List<Color> gradient;

  SkillBlock({
    this.title = "",
    this.subtitle = "",
    this.isChosen = true,
    this.gradient = const [GREEN_DARK, GREEN_LIGHT],
    this.editMode = false,
  }) {
    if (this.isChosen == false) this.gradient = const [GRAY, GRAY];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      height: 150.0,
      width: 150.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(BTN_RADIUS)),
        gradient: LinearGradient(colors: this.gradient),
        boxShadow: [
          (this.isChosen
              ? BoxShadow(
                  color: BROWN_SHADOW_25,
                  offset: Offset(0, SHADOW_OFFSET),
                  blurRadius: SHADOW_RADIUS,
                )
              : BoxShadow(
                  color: BROWN_SHADOW_25,
                )),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          (this.editMode
              ? SmallInputField(text: this.title)
              : Text(
                  this.title.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: (this.isChosen ? WHITE : WHITE.withOpacity(0.7)),
                    fontSize: 22.0,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                  ),
                )),
          SizedBox(
            height: 24.0,
          ),
          Text(
            this.subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: (this.isChosen ? WHITE : WHITE.withOpacity(0.7)),
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
