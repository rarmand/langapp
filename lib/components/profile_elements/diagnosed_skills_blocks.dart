import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class DiagnosedSkillsBlocks extends StatelessWidget {
  final bool isChosen;
  List<SkillBlock> skillsList = [];

  DiagnosedSkillsBlocks({this.isChosen = true}) {
    skillsList = [
      SkillBlock(
        subtitle: "speaking",
        isChosen: this.isChosen,
        gradient: [
          GREEN_DARK,
          GREEN_LIGHT.withAlpha(128),
        ],
      ),
      SkillBlock(
        title: "25%",
        subtitle: "reading",
        isChosen: this.isChosen,
        gradient: [
          YELLOW,
          YELLOW.withAlpha(128),
        ],
      ),
      SkillBlock(
        title: "25%",
        subtitle: "listening",
        isChosen: this.isChosen,
        gradient: [
          BROWN_DARK,
          BROWN_DARK.withAlpha(128),
        ],
      ),
      SkillBlock(
        title: "25%",
        subtitle: "writing",
        isChosen: this.isChosen,
        gradient: [
          BROWN_LIGHT,
          BROWN_LIGHT.withAlpha(128),
        ],
      )
    ];
  }

  // TODO: ustalenie żeby był rozdział matrix 2 x 2 przy szerszym oknie
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.0, bottom: 5.0),
      child: Wrap(spacing: 10.0, children: skillsList),
    );
  }
}

class SkillBlock extends StatelessWidget {
  final bool isChosen;
  final String title;
  final String subtitle;
  List<Color> gradient;

  SkillBlock({
    this.title = "",
    this.subtitle = "",
    this.isChosen = true,
    this.gradient = const [GREEN_DARK, GREEN_LIGHT],
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
          Text(
            this.title.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: (this.isChosen ? WHITE : WHITE.withOpacity(0.7)),
              fontSize: 22.0,
              fontFamily: "Roboto",
              fontWeight: FontWeight.bold,
            ),
          ),
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
