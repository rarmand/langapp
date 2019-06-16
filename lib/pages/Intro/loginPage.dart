import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:langapp/components/ButtonFilled/main.dart';
import 'package:langapp/components/ButtonOutlined/main.dart';
import 'package:langapp/components/InputField/main.dart';
import 'package:langapp/components/Logo/main.dart';

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
              Transform.scale(
                scale: 0.8,
                child: LogoBig(topPadding: 30.0),
              ),
              const SizedBox(height: 40),
              Container(
                child: Column(
                  children: <Widget>[
                    InputField(title: "Login"),
                    InputField(
                      title: "Password",
                      isPassword: true,
                    ),
                    Text(
                      "Forgot password?",
                      style: TextStyle(
                        fontSize: 12,
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
