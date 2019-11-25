import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:langapp/components/button_filled/button_filled.dart';
import 'package:langapp/components/frame/frame.dart';
import 'package:langapp/components/input_field/input_field.dart';
import 'package:langapp/components/logo/arrow.dart';
import 'package:langapp/components/logo/logo_mid.dart';
import 'package:langapp/components/modals/reset_password_modal.dart';
import 'package:langapp/styles/colors.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email;

  String _onEmailValidator(String input) {
    if (input.isEmpty) return "Provide an email";

    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regexp = new RegExp(pattern);

    if (!regexp.hasMatch(input)) return "Email is not valid";

    return null;
  }

  void _onEmailSaved(String input) => this._email = input;

  @override
  Widget build(BuildContext context) {
    return Frame(
      child: Form(
        key: this._formKey,
        child: IntrinsicHeight(
          child: Column(
            children: [
              Arrow(
                child: LogoMid(),
                onPressed: () => Navigator.pop(context),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 40.0),
                      width: BTN_WIDTH,
                      child: Text(
                        "Please enter your email where we will send further instructions.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11,
                        ),
                      ),
                    ),
                    InputField(
                      label: "Email",
                      onSaved: this._onEmailSaved,
                      validator: this._onEmailValidator,
                    ),
                  ],
                ),
              ),
              ButtonFilled(
                btnText: "Send",
                onPressed: this._validateAndResetPassword,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  void _validateAndResetPassword() async {
    final form = this._formKey.currentState;

    if (form.validate()) {
      form.save();
      print("Form is valid. Email: $_email");

      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: this._email);
        Navigator.of(context).push(
          PageRouteBuilder(
            opaque: false,
            pageBuilder: (BuildContext context, _, __) => ResetPasswordModal(email: this._email),
          ),
        );
      } catch (e) {
        debugPrint(e.message);
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return SimpleDialog(
                title: Text(
                  "Error",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                contentPadding: EdgeInsets.all(24),
                children: <Widget>[Text(e.message.toString())],
              );
            });
      }
    }
  }
}
