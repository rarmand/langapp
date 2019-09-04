import 'package:flutter/material.dart';
import 'package:langapp/components/button_filled/button_filled.dart';
import 'package:langapp/components/input_field/input_field.dart';
import 'package:langapp/styles/colors.dart';

// TODO: scrollowanie
// TODO: zablokować background , zeby nic tam nie dzialalo po nacisnięciu, tylko wróciło do poprzedniej strony
class ProfileEditionModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE.withOpacity(0.95),
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(36.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Edit profile",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: GREEN_LIGHT,
                  ),
                ),
                SizedBox(height: 40.0),
                InputField(label: "Username", existingText: "Isermfmkfo"),
                InputField(label: "Email", existingText: "Isermfmkfo"),
                InputField(label: "Old password", existingText: "Isermfmkfo", isPassword: true),
                InputField(label: "New password", existingText: "Isermfmkfo", isPassword: true),
                InputField(label: "Confirm new password", existingText: "Isermfmkfo", isPassword: true),
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
