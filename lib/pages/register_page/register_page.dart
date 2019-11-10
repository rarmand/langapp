import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:langapp/components/button_filled/button_filled.dart';
import 'package:langapp/components/frame/frame.dart';
import 'package:langapp/components/input_field/input_field.dart';
import 'package:langapp/components/logo/arrow.dart';
import 'package:langapp/components/logo/logo_mid.dart';
import 'package:langapp/model/app_model.dart';
import 'package:langapp/styles/colors.dart';
import 'package:scoped_model/scoped_model.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _username, _email, _password;

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

  void _onUsernameSaved(String input) => this._username = input;
  void _onEmailSaved(String input) => this._email = input;
  void _onPasswordSaved(String input) => this._password = input;

  @override
  Widget build(BuildContext context) {
    return Frame(
      child: Form(
        key: this._formKey,
        child: IntrinsicHeight(
          child: Column(
            children: <Widget>[
              Arrow(
                child: LogoMid(),
                onPressed: () => Navigator.pushReplacementNamed(context, "/login"),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    InputField(
                      label: "Username",
                      onSaved: this._onUsernameSaved,
                      validator: this._onUsernameValidator,
                    ),
                    InputField(
                      label: "Email",
                      onSaved: this._onEmailSaved,
                      validator: this._onEmailValidator,
                    ),
                    InputField(
                      label: "Password",
                      isPassword: true,
                      onSaved: this._onPasswordSaved,
                      validator: this._onPasswordValidator,
                    ),
                    Container(
                      width: BTN_WIDTH - 10,
                      child: Text(
                        "Password has to contain 10 characters: small letters, capital lettes, numbers",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                  ],
                ),
              ),
              ButtonFilled(
                btnText: "Sign up",
                onPressed: this._validateAndRegister,
              ),
              Container(
                width: BTN_WIDTH,
                child: Text(
                  "You agree to Langgarden’s Terms of Service and Privacy Policy.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 9),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  void _validateAndRegister() async {
    final form = this._formKey.currentState;

    if (form.validate()) {
      form.save();

      try {
        // authentication
        AuthResult result =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(email: this._email, password: this._password);

        // set all the rest of data in database
        ScopedModel.of<UserModel>(context)
            .setNewUserData(uid: result.user.uid, username: this._username, email: this._email);

        Navigator.pushNamed(context, '/welcome');

        // TODO: wyrzucić komunikat że konto na dany adres email już istnieje
      } catch (e) {
        print(e.message);
        if (e.message.toString().contains("The email address is already in use by another account")) {
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
}
