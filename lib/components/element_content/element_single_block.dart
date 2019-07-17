import 'package:flutter/material.dart';
import 'package:langapp/components/profile_elements/diagnosed_skills_blocks.dart';
import 'package:langapp/styles/colors.dart';

class ElementSingleBlock extends StatelessWidget {
  final bool isChosen;
  final String title;
  final String subtitle;
  List<Color> gradient;

  // TODO: jak nazywać, jak prioryretyzować nazwy, required data
  ElementSingleBlock({this.title, this.subtitle, this.gradient, this.isChosen = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: SkillBlock(
        title: this.title,
        subtitle: this.subtitle,
        gradient: this.gradient,
        isChosen: this.isChosen,
      ),
    );
  }
}
