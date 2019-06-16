import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:langapp/components/InputField/main.dart';
import 'package:langapp/components/Logo/main.dart';
import 'package:langapp/styles/colors.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Transform.scale(
                  scale: 0.8,
                  child: LogoBig(),
                ),
                const SizedBox(height: 30),
                Column(
                  children: <Widget>[
                    InputField(title: "Login"),
                    InputField(
                      title: "Password",
                      isPassword: true,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
