import 'package:flutter/material.dart';
import 'package:langapp/components/button_filled/button_filled.dart';
import 'package:langapp/components/profile_elements/diagnosed_skills_blocks.dart';
import 'package:langapp/styles/colors.dart';

// TODO: nadać możliwość edycji bloków
class LearningSettingsEditionModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE.withOpacity(0.95),
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
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
                SizedBox(height: 24.0),
                DiagnosedSkillsBlocks(editMode: true),
                SizedBox(height: 40.0),
                ButtonFilled(
                  btnText: "Save",
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
