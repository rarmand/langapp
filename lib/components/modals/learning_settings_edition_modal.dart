import 'package:flutter/material.dart';
import 'package:langapp/components/button_filled/button_filled.dart';
import 'package:langapp/components/profile_elements/diagnosed_skills_blocks.dart';
import 'package:langapp/model/app_model.dart';
import 'package:langapp/styles/colors.dart';
import 'package:scoped_model/scoped_model.dart';

class LearningSettingsEditionModal extends StatefulWidget {
  LearningSettingsEditionModal();

  @override
  _LearningSettingsEditionModalState createState() => _LearningSettingsEditionModalState();
}

class _LearningSettingsEditionModalState extends State<LearningSettingsEditionModal> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE.withOpacity(0.95),
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Form(
          key: this._formKey,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Edit my method",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: GREEN_LIGHT,
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  DiagnosedSkillsBlocks(isAutoMethod: false, editMode: true),
                  const SizedBox(height: 40.0),
                  ButtonFilled(
                    btnText: "Save",
                    onPressed: this._validateAndSaveEdition,
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _validateAndSaveEdition() {
    final form = this._formKey.currentState;
    if (form.validate()) {
      Map skillset = ScopedModel.of<UserModel>(context).newSkillsetUser;
      int sum = 0;
      skillset.forEach((key, value) {
        sum += value;
      });

      if (sum == 100) {
        form.save();
        Navigator.pop(context);
      }
      //////////////////////////////////////////
      else {
        showDialog(
          context: context,
          builder: (context) => SimpleDialog(
            title: Text(
              "Error for proper diagnose",
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            contentPadding: EdgeInsets.all(24.0),
            children: <Widget>[
              Text(
                "The skills have to give in sum 100%!",
              )
            ],
          ),
        );
      }
    }
  }
}
