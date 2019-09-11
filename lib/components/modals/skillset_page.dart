import 'package:flutter/material.dart';
import 'package:langapp/components/appbar_upper/appbar_upper.dart';
import 'package:langapp/components/element_content/element_button.dart';
import 'package:langapp/components/element_content/element_checkbox.dart';
import 'package:langapp/components/element_content/element_content.dart';
import 'package:langapp/components/modals/learning_settings_edition_modal.dart';
import 'package:langapp/components/profile_elements/diagnosed_skills_blocks.dart';

class SkillsetBlock extends StatefulWidget {
  final bool diagnosedMethod = false;

  @override
  _SkillsetBlockState createState() => _SkillsetBlockState();
}

class _SkillsetBlockState extends State<SkillsetBlock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUpper(
        title: "Diagnosed skillset",
        isCourseAppBar: true,
        onLogoTap: () => Navigator.pushNamedAndRemoveUntil(context, "/", (Route<dynamic> route) => false),
        onClosePressed: () => Navigator.pushNamedAndRemoveUntil(context, "/", (Route<dynamic> route) => false),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(24, 0, 24, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ElementContent(
                  title: "Learning settings",
                  subtitle:
                      "Diagnosed method of learning with the application algorithm.\n\nPresented values inform which skill works better in learning process.",
                  element: DiagnosedSkillsBlocks(isChosen: this.widget.diagnosedMethod),
                ),
                ElementCheckbox(name: "Choose your method of learning"),
                ElementButton(
                  name: "Edit my method",
                  buttonIcon: Icons.edit,
                  onPressed: () => Navigator.of(context).push(
                    PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (BuildContext context, _, __) => LearningSettingsEditionModal(),
                    ),
                  ),
                ),
                ElementContent(
                  subtitle: "The method of learning set by the user.",
                  element: DiagnosedSkillsBlocks(isChosen: !this.widget.diagnosedMethod),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
