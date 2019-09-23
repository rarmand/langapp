import 'package:flutter/material.dart';
import 'package:langapp/components/button_filled/button_filled.dart';
import 'package:langapp/components/profile_elements/diagnosed_skills_blocks.dart';
import 'package:langapp/model/app_model.dart';
import 'package:langapp/styles/colors.dart';
import 'package:scoped_model/scoped_model.dart';

// TODO: nadać możliwość edycji bloków - do zrobienia! wymmiana w b azie danych
class LearningSettingsEditionModal extends StatefulWidget {
  LearningSettingsEditionModal();

  @override
  _LearningSettingsEditionModalState createState() => _LearningSettingsEditionModalState();
}

class _LearningSettingsEditionModalState extends State<LearningSettingsEditionModal> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map _skillset = {};

  @override
  void initState() {
    super.initState();

    this._skillset = ScopedModel.of<UserModel>(context).skillsetUser;
    print(this._skillset);
  }

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
                  DiagnosedSkillsBlocks(skillset: this._skillset, editMode: true),
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
      form.save();
      Navigator.pop(context);

      // try {
      //   var result =
      //       await FirebaseAuth.instance.signInWithEmailAndPassword(email: this._email, password: this._password);
      //   print(result.user);

      //   ScopedModel.of<UserModel>(context).setUserId(uid: result.user.uid);
      //   ScopedModel.of<UserModel>(context).setEmail(email: result.user.email);

      //   // TODO: pewnie wyświetlić błąd jak nie da się zalogować

      // } catch (e) {
      //   print(e.message);
      // }
    }
  }
}
