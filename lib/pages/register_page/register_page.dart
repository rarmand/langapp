import 'package:flutter/material.dart';
import 'package:langapp/components/button_filled/button_filled.dart';
import 'package:langapp/components/input_field/input_field.dart';
import 'package:langapp/components/logo/arrow.dart';
import 'package:langapp/components/logo/logo_mid.dart';
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
              Arrow(child: LogoMid()),
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
                      width: BTN_WIDTH - 10,
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
                    width: BTN_WIDTH,
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
