import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:langapp/components/button_filled/button_filled.dart';
import 'package:langapp/components/button_outlined/button_outlined.dart';
import 'package:langapp/components/frame/frame.dart';
import 'package:langapp/components/input_field/input_field.dart';
import 'package:langapp/components/logo/logo_mid.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:langapp/model/app_model.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email;
  String _password;

  void pushResetPassword() => Navigator.of(context).pushNamed('/reset_password');

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

    return null;
  }

  void _onEmailSaved(String input) => this._email = input;
  void _onPasswordSaved(String input) => this._password = input;

  @override
  Widget build(BuildContext context) {
    return Frame(
      child: Form(
        key: this._formKey,
        // TODO: intrinsic ponoć not good - zastanowić się
        // czy da się inaczej expanded + scroll view
        // scroll view - do wysuwania się klawiatury
        child: IntrinsicHeight(
          child: Column(
            children: <Widget>[
              LogoMid(),
              Expanded(
                child: Column(
                  children: <Widget>[
                    InputField(
                      label: "Email",
                      validator: this._onEmailValidator,
                      onSaved: this._onEmailSaved,
                    ),
                    InputField(
                      label: "Password",
                      isPassword: true,
                      validator: this._onPasswordValidator,
                      onSaved: this._onPasswordSaved,
                    ),
                    const SizedBox(height: 4.0),
                    InkWell(
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onTap: this.pushResetPassword,
                    ),
                  ],
                ),
              ),
              ButtonFilled(
                btnText: "Sign in",
                onPressed: this._validateAndLogin,
              ),
              ButtonOutlined(
                btnText: "Sign up",
                onPressed: () => Navigator.pushNamed(context, '/register'),
              ),
              const SizedBox(
                height: 16.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _validateAndLogin() async {
    final form = this._formKey.currentState;
    if (form.validate()) {
      form.save();

      try {
        AuthResult result =
            await FirebaseAuth.instance.signInWithEmailAndPassword(email: this._email, password: this._password);

        ScopedModel.of<UserModel>(context).setUserId(uid: result.user.uid);
        ScopedModel.of<UserModel>(context).setUserData(uid: result.user.uid);

        // TODO: pewnie wyświetlić błąd jak nie da się zalogować
        Navigator.pushNamed(context, '/');
      } catch (e) {
        print(e.message);
        if (e.message.toString().contains("password is invalid")) {
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
