import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:langapp/components/ButtonFilled/main.dart';
import 'package:langapp/components/InputField/main.dart';
import 'package:langapp/components/Logo/logoMid.dart';
import 'package:langapp/components/Logo/main.dart';
import 'package:langapp/styles/colors.dart';

class ResetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // TODO
              // poprawnie skalibrować rozmieszczenie logo ze strzałką
              LogoMid(),
              const SizedBox(height: 30),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(bottom: 30.0),
                      width: btnWidth,
                      child: Text(
                        "Please enter your email where we will send further instructions.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11,
                        ),
                      ),
                    ),
                    InputField(title: "Email"),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  const SizedBox(height: 90),

                  // TODO
                  // Navigation
                  // dialog information about sent message
                  // properly working swap

                  ButtonFilled(
                    btnText: "Send",
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
