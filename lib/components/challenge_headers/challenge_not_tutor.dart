import 'package:flutter/material.dart';
import 'package:langapp/components/element_content/element_content.dart';
import 'package:langapp/components/element_content/element_single_block.dart';
import 'package:langapp/styles/colors.dart';

class ChallengeNotTutor extends StatelessWidget {
  int userPoints;

  ChallengeNotTutor({@required this.userPoints});

  @override
  Widget build(BuildContext context) {
    return ElementContent(
      title: "Become a tutor!",
      subtitle:
          "Reuse your knowledge in real work.\nHelp other users in learning, teach them or check their tasks from challenges.\n\nTo become a tutor you should have more than 10 000 points. Good luck!",
      element: ElementSingleBlock(
        title: "I want to be\na tutor!",
        subtitle: "Test yourself",
        gradient: (userPoints > 100000 ? [YELLOW, YELLOW] : [GRAY, GRAY]),
      ),
    );
  }
}
