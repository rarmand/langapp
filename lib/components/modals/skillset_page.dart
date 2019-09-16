import 'package:cloud_firestore/cloud_firestore.dart';
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
  bool _diagnosedMethod = false;
  Map _diagnosedSkills = {
    "listening": 25,
    "writing": 25,
    "speaking": 25,
    "reading": 25,
  };
  Map _userSetSkills = {
    "listening": 25,
    "writing": 25,
    "speaking": 25,
    "reading": 25,
  };

  @override
  void initState() {
    super.initState();
    this._getData();
  }

  void _getData() async {
    String userId = ScopedModel.of<UserModel>(context).userId;
    DocumentSnapshot ds = await Firestore.instance.collection('users').document(userId).get();

    if (ds.exists) {
      Map course = ds.data['courses'][this.widget.index];

      // TODO: czy można lepiej to napisać?
      // stream ?
      setState(() {
        this._diagnosedMethod = !course['skills']['auto'];
        this._diagnosedSkills['reading'] = course['skills']['reading_auto'];
        this._diagnosedSkills['listening'] = course['skills']['listening_auto'];
        this._diagnosedSkills['speaking'] = course['skills']['speaking_auto'];
        this._diagnosedSkills['writing'] = course['skills']['writing_auto'];

        this._userSetSkills['reading'] = course['skills']['reading'];
        this._userSetSkills['listening'] = course['skills']['listening'];
        this._userSetSkills['speaking'] = course['skills']['speaking'];
        this._userSetSkills['writing'] = course['skills']['writing'];
      });
    }
  }

  void _onChosenMethodChange(bool change) async {
    String userId = ScopedModel.of<UserModel>(context).userId;

    print("Before " + this._diagnosedMethod.toString());
    setState(() {
      this._diagnosedMethod = !this._diagnosedMethod;
    });

    print("After " + this._diagnosedMethod.toString());
    await Firestore.instance.collection('users').document(userId).updateData({"auto": this._diagnosedMethod});
  }

  void _onEditPressed() {
    if (!this._diagnosedMethod) {
      ScopedModel.of<UserModel>(context).setSkillset(skillset: this._userSetSkills);
      print(ScopedModel.of<UserModel>(context).skillset);

      Navigator.of(context).push(
        PageRouteBuilder(
          opaque: false,
          pageBuilder: (BuildContext context, _, __) => LearningSettingsEditionModal(
            skillset: this._userSetSkills,
          ),
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
                    isChosen: this._diagnosedMethod,
                    skillset: this._diagnosedSkills,
                  ),
                ),
                ElementCheckbox(
                  name: "Choose your method of learning",
                  isChecked: !this._diagnosedMethod,
                  onChanged: this._onChosenMethodChange,
                ),
                ElementButton(
                  name: "Edit my method",
                  buttonIcon: Icons.edit,
                  disabled: this._diagnosedMethod,
                  onPressed: this._onEditPressed,
                ),
                ElementContent(
                  subtitle: "The method of learning set by the user.",
                  element: DiagnosedSkillsBlocks(
                    isChosen: !this._diagnosedMethod,
                    skillset: this._userSetSkills,
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
