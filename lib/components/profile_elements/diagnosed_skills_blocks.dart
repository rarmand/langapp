import 'package:flutter/material.dart';
import 'package:langapp/components/profile_elements/skill_block.dart';
import 'package:langapp/styles/colors.dart';

class DiagnosedSkillsBlocks extends StatelessWidget {
  final bool isChosen;
  final bool editMode;
  List<SkillBlock> skillsList = [];
  Map skillset = {};

  DiagnosedSkillsBlocks({this.isChosen = true, this.skillset, this.editMode = false}) {
    skillsList = [
      SkillBlock(
        title: this.skillset['speaking'].toString() + "%",
        subtitle: "speaking",
        isChosen: this.isChosen,
        editMode: this.editMode,
        gradient: [
          GREEN_DARK,
          GREEN_LIGHT.withAlpha(128),
        ],
      ),
      SkillBlock(
        title: this.skillset['reading'].toString() + "%",
        subtitle: "reading",
        isChosen: this.isChosen,
        editMode: this.editMode,
        gradient: [
          YELLOW,
          YELLOW.withAlpha(128),
        ],
      ),
      SkillBlock(
        title: this.skillset['listening'].toString() + "%",
        subtitle: "listening",
        isChosen: this.isChosen,
        editMode: this.editMode,
        gradient: [
          BROWN_DARK,
          BROWN_DARK.withAlpha(128),
        ],
      ),
      SkillBlock(
        title: this.skillset['writing'].toString() + "%",
        subtitle: "writing",
        isChosen: this.isChosen,
        editMode: this.editMode,
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
      padding: EdgeInsets.only(top: 20.0, bottom: 4.0),
      child: Wrap(spacing: 10.0, children: skillsList),
    );
  }
}
