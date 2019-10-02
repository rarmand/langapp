import 'package:flutter/material.dart';
import 'package:langapp/components/appbar_upper/appbar_upper.dart';
import 'package:langapp/components/element_content/element_button.dart';
import 'package:langapp/components/element_content/element_checkbox.dart';
import 'package:langapp/components/element_content/element_content.dart';
import 'package:langapp/components/modals/learning_settings_edition_modal.dart';
import 'package:langapp/components/profile_elements/diagnosed_skills_blocks.dart';
import 'package:langapp/model/app_model.dart';
import 'package:scoped_model/scoped_model.dart';

class SkillsetPage extends StatefulWidget {
  String index;

  SkillsetPage({@required this.index});

  @override
  _SkillsetPageState createState() => _SkillsetPageState();
}

// TODO: do skonczenia

class _SkillsetPageState extends State<SkillsetPage> {
  bool _autoMethod;

  @override
  void initState() {
    super.initState();
    ScopedModel.of<UserModel>(context).setSkillset(index: this.widget.index);
    setState(() {
      this._autoMethod = ScopedModel.of<UserModel>(context).autoSkillset;
    });
  }

  void _onChosenMethodChange(bool change) async {
    setState(() {
      this._autoMethod = !this._autoMethod;
    });
    // update bazy w ScopedModel
    ScopedModel.of<UserModel>(context, rebuildOnChange: true)
        .setAutoMethod(isAuto: this._autoMethod, index: this.widget.index);
  }

  void _onEditPressed() {
    if (!this._autoMethod) {
      ScopedModel.of<UserModel>(context).setEditedCourseSkillsetIndex(index: this.widget.index);
      Navigator.of(context).push(
        PageRouteBuilder(
          opaque: false,
          pageBuilder: (BuildContext context, _, __) => LearningSettingsEditionModal(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUpper(
        title: "Diagnosed skillset",
        isCourseAppBar: true,
        onLogoTap: () => Navigator.pushNamedAndRemoveUntil(context, "/", (Route<dynamic> route) => false),
        onClosePressed: () => Navigator.pop(context),
      ),
      //
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(24, 0, 24, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //
                ElementContent(
                  title: "Learning settings",
                  subtitle:
                      "Diagnosed method of learning with the application algorithm.\n\nPresented values inform which skill works better in learning process.",
                  element: DiagnosedSkillsBlocks(
                    isChosen: this._autoMethod,
                    isAutoMethod: true,
                  ),
                ),
                ElementCheckbox(
                  name: "Choose your method of learning",
                  isChecked: !this._autoMethod,
                  onChanged: this._onChosenMethodChange,
                ),
                ElementButton(
                  name: "Edit my method",
                  buttonIcon: Icons.edit,
                  disabled: this._autoMethod,
                  onPressed: this._onEditPressed,
                ),
                //
                ElementContent(
                  subtitle: "The method of learning set by the user.",
                  element: DiagnosedSkillsBlocks(
                    isChosen: !this._autoMethod,
                    isAutoMethod: false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
