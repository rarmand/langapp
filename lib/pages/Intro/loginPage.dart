import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:langapp/components/ButtonFilled/main.dart';
import 'package:langapp/components/ButtonOutlined/main.dart';
import 'package:langapp/components/InputField/main.dart';
import 'package:langapp/components/Logo/logoMid.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              LogoMid(),
              Container(
                child: Column(
                  children: <Widget>[
                    InputField(title: "Email"),
                    InputField(
                      title: "Password",
                      isPassword: true,
                    ),
                    Text(
                      "Forgot password?",
                      style: TextStyle(
                        fontSize: 11,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  const SizedBox(height: 60),
                  ButtonFilled(
                    btnText: "Sign in",
                  ),
                  ButtonOutlined(
                    btnText: "Sign up",
                  ),
                  const SizedBox(height: 30),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
