import 'package:flutter/material.dart';
import 'package:langapp/components/profile_elements/skill_block.dart';
import 'package:langapp/model/app_model.dart';
import 'package:langapp/styles/colors.dart';
import 'package:scoped_model/scoped_model.dart';

class DiagnosedSkillsBlocks extends StatelessWidget {
  final bool isChosen;
  final bool editMode;
  final bool isAutoMethod;

  DiagnosedSkillsBlocks({this.isChosen = true, @required this.isAutoMethod, this.editMode = false});

  @override
  Widget build(BuildContext context) {
    Map skillset = (isAutoMethod
        ? ScopedModel.of<UserModel>(context, rebuildOnChange: true).skillsetDiagnosed
        : ScopedModel.of<UserModel>(context, rebuildOnChange: true).skillsetUser);

    List<SkillBlock> skillsList = [
      SkillBlock(
        title: skillset['speaking'].toString() + "%",
        subtitle: "speaking",
        isChosen: this.isChosen,
        editMode: this.editMode,
        gradient: [
          GREEN_DARK,
          GREEN_LIGHT.withAlpha(128),
        ],
      ),
      SkillBlock(
        title: skillset['reading'].toString() + "%",
        subtitle: "reading",
        isChosen: this.isChosen,
        editMode: this.editMode,
        gradient: [
          YELLOW,
          YELLOW.withAlpha(128),
        ],
      ),
      SkillBlock(
        title: skillset['listening'].toString() + "%",
        subtitle: "listening",
        isChosen: this.isChosen,
        editMode: this.editMode,
        gradient: [
          BROWN_DARK,
          BROWN_DARK.withAlpha(128),
        ],
      ),
      SkillBlock(
        title: skillset['writing'].toString() + "%",
        subtitle: "writing",
        isChosen: this.isChosen,
        editMode: this.editMode,
        gradient: [
          BROWN_LIGHT,
          BROWN_LIGHT.withAlpha(128),
        ],
      )
    ];
    return Container(
      padding: EdgeInsets.only(top: 20.0, bottom: 4.0),
      child: Wrap(spacing: 10.0, children: skillsList),
    );
  }
}
