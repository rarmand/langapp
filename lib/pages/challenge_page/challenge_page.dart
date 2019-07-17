import 'package:flutter/material.dart';
import 'package:langapp/components/element_content/element_content.dart';
import 'package:langapp/components/element_content/element_single_block.dart';
import 'package:langapp/components/frame/menu_frame.dart';
import 'package:langapp/styles/colors.dart';

class ChallengePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MenuFrame(
      title: "Challenge",
      chosen: 1,
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          children: <Widget>[
            ElementSingleBlock(
              title: "2533",
              subtitle: "your points",
              gradient: [BROWN_LIGHT, BROWN_DARK],
            ),
            ElementContent(
              title: "Take a challenge!",
              subtitle:
                  "Use your language skills in real world\nFind pleasure in other ways to learn language\n\nTake a challenge for your points.\nAccomplish it in two weeks since the start",
              element: ElementSingleBlock(
                title: "Challenge!",
                subtitle: "500 points",
                gradient: [GREEN_LIGHT, GREEN_DARK],
              ),
            ),
            ElementContent(
              title: "Become a tutor!",
              subtitle:
                  "Reuse your knowledge in real work.\nHelp other users in learning, teach them or check their tasks from challenges.\n\nTo become a tutor you should have more than 10 000 points. Good luck!",
              element: ElementSingleBlock(
                title: "I want to be\na tutor!",
                subtitle: "Test yourself",
                gradient: [YELLOW, YELLOW],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
