import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:langapp/components/button_filled/button_filled.dart';
import 'package:langapp/components/input_field/input_field.dart';
import 'package:langapp/model/app_model.dart';
import 'package:langapp/styles/colors.dart';
import 'package:scoped_model/scoped_model.dart';

// TODO: zablokować background , zeby nic tam nie dzialalo po nacisnięciu, tylko wróciło do poprzedniej strony
class ProfileEditionModal extends StatefulWidget {
  @override
  _ProfileEditionModalState createState() => _ProfileEditionModalState();
}

class _ProfileEditionModalState extends State<ProfileEditionModal> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _username = "", _email = "", _password = "", _newPassword = "", _confirmNewPassword = "";

  @override
  void initState() {
    super.initState();

    setState(() {
      _username = ScopedModel.of<UserModel>(context).username;
      _email = ScopedModel.of<UserModel>(context).email;
    });
  }

  String _onUsernameValidator(String input) {
    if (input.isEmpty)
      return "Provide a username";
    else if (input.length < 4) return "Username must be longer than 3 signs";

    return null;
  }

  String _onEmailValidator(String input) {
    if (input.isEmpty) return "Provide an email";

    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regexp = new RegExp(pattern);

    if (!regexp.hasMatch(input)) return "Email is not valid";

    return null;
  }

  String _onPasswordValidator(String input) {
    if (input.isEmpty)
      return "Provide a password";
    else if (input.length < 10) return "Password is too short";

    Pattern pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{10,}$';
    RegExp regexp = new RegExp(pattern);

    if (!regexp.hasMatch(input)) return "Password is not valid";

    return null;
  }

  String _onNewPasswordValidator(String input) {
    if (input.length > 0) {
      if (input.length < 10) return "Password is too short";
      Pattern pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{10,}$';
      RegExp regexp = new RegExp(pattern);

      if (!regexp.hasMatch(input))
        return "Password is not valid";
      else if (this._password == input) return "Password cannot be an old password";
    }

    return null;
  }

  String _onConfirmNewPasswordValidator(String input) {
    if (this._newPassword != input) return "The password must be the same";
    return null;
  }

  void _onUsernameSaved(String input) => this._username = input;
  void _onEmailSaved(String input) => this._email = input;
  void _onPasswordSaved(String input) => this._password = input;
  void _onNewPasswordSaved(String input) => this._newPassword = input;
  void _onConfirmNewPasswordSaved(String input) => this._confirmNewPassword = input;

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
            child: Form(
              key: this._formKey,
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
                  const SizedBox(height: 24.0),
                  InputField(
                    label: "Username",
                    existingText: this._username,
                    onSaved: this._onUsernameSaved,
                    validator: this._onUsernameValidator,
                  ),
                  InputField(
                    label: "Email",
                    existingText: this._email,
                    onSaved: this._onEmailSaved,
                    validator: this._onEmailValidator,
                  ),
                  InputField(
                    label: "New password",
                    isPassword: true,
                    onSaved: this._onNewPasswordSaved,
                    validator: this._onNewPasswordValidator,
                  ),
                  InputField(
                    label: "Confirm new password",
                    isPassword: true,
                    onSaved: this._onConfirmNewPasswordSaved,
                    validator: this._onConfirmNewPasswordValidator,
                  ),
                  const SizedBox(height: 24.0),
                  Text(
                    "Every edition must be confirmed with password!",
                    textAlign: TextAlign.left,
                  ),
                  InputField(
                    label: "Password",
                    isPassword: true,
                    onSaved: this._onPasswordSaved,
                    validator: this._onPasswordValidator,
                  ),
                  SizedBox(height: 24.0),
                  ButtonFilled(
                    btnText: "Save",
                    onPressed: this._validateAndUpdate,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _validateAndUpdate() async {
    final form = this._formKey.currentState;
    form.save();

    if (form.validate()) {
      print(
          "Form is valid. Email: $_email, password: $_password, username: $_username, pass: $_password, new: $_newPassword, conf: $_confirmNewPassword");

      try {
        String oldEmail = ScopedModel.of<UserModel>(context).email;
        String oldUsername = ScopedModel.of<UserModel>(context).username;

        // authentication
        var result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: oldEmail, password: this._password);
        print(result.user);

        // zmiana emaila
        if (oldEmail != this._email) {
          result.user.updateEmail(this._email);
          ScopedModel.of<UserModel>(context).setEmail(email: this._email);
        }

        // zmiana hasła
        if (this._newPassword.length > 0) {
          result.user.updatePassword(this._newPassword);
        }

        // zmiana nazwy usera
        if (oldUsername != this._username) {
          // add to database
          Firestore.instance.collection("users").document(result.user.uid).updateData({
            'username': this._username,
          });

          ScopedModel.of<UserModel>(context).setUsername(username: this._username);
        }

        Navigator.pop(context);
      } catch (e) {
        print(e.message);
      }
    }
  }
}
