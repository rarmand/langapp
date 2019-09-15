import 'package:flutter/material.dart';
import 'package:langapp/components/element_content/element_content.dart';
import 'package:langapp/components/element_content/element_single_block.dart';
import 'package:langapp/styles/colors.dart';

class ChallengeNotChallenged extends StatelessWidget {
  final Function onTap;
  final bool disabled;

  ChallengeNotChallenged({@required this.onTap, @required this.disabled});

  @override
  Widget build(BuildContext context) {
    return ElementContent(
      title: "Take a challenge!",
      subtitle:
          "Use your language skills in real world\nFind pleasure in other ways to learn language\n\nTake a challenge for your points.\nAccomplish it in two weeks since the start",
      element: InkWell(
        child: ElementSingleBlock(
          title: "Challenge!",
          subtitle: "500 points",
          gradient: (disabled ? [GRAY, GRAY] : [GREEN_LIGHT, GREEN_DARK]),
        ),
        onTap: (disabled ? () {} : this.onTap),
      ),
    );
  }
}
