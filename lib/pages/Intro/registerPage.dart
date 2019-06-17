import 'package:flutter/material.dart';
import 'package:langapp/components/ButtonFilled/main.dart';
import 'package:langapp/components/InputField/main.dart';
import 'package:langapp/components/Logo/main.dart';
import 'package:langapp/styles/colors.dart';

class RegisterPage extends StatelessWidget {
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 50, 0, 0),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Color(BROWN_DARK),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(right: 30),
                      child: Transform.scale(
                        scale: 0.8,
                        child: LogoBig(topPadding: 30.0),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Container(
                child: Column(
                  children: <Widget>[
                    InputField(title: "Username"),
                    InputField(title: "Email"),
                    InputField(
                      title: "Password",
                      isPassword: true,
                    ),
                    Container(
                      width: btnWidth,
                      child: Text(
                        "Password has to contain 10 characters: small letters, capital lettes, numbers",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  const SizedBox(height: 40),
                  ButtonFilled(
                    btnText: "Sign up",
                  ),
                  Container(
                    width: btnWidth,
                    child: Text(
                      "You agree to Langgarden’s Terms of Service and Privacy Policy.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 9,
                      ),
                    ),
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
