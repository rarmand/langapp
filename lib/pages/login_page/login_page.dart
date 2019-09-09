import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:langapp/components/button_filled/button_filled.dart';
import 'package:langapp/components/button_outlined/button_outlined.dart';
import 'package:langapp/components/frame/frame.dart';
import 'package:langapp/components/input_field/input_field.dart';
import 'package:langapp/components/logo/logo_mid.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  String _email;
  String _password;

  void validateAndLogin() {
    final form = formKey.currentState;
    if (form.validate()) {
      print("Form is valid. Email: $_email, password: $_password");
    } else {
      print("Form is invalid. Email: $_email, password: $_password");
    }
    // Navigator.pushNamed(context, '/');
  }

  void pushResetPassword() => Navigator.of(context).pushNamed('/reset_password');

  @override
  Widget build(BuildContext context) {
    return Frame(
      children: <Widget>[
        LogoMid(),
        Form(
          key: this.formKey,
          child: Column(
            children: <Widget>[
              InputField(label: "Email"),
              InputField(
                label: "Password",
                isPassword: true,
              ),
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
              const SizedBox(height: 60),
              ButtonFilled(
                btnText: "Sign in",
                onPressed: this.validateAndLogin,
              ),
              ButtonOutlined(
                btnText: "Sign up",
                onPressed: () => Navigator.pushNamed(context, '/register'),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ],
    );
  }
}
