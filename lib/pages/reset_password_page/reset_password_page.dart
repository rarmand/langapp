import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:langapp/components/button_filled/button_filled.dart';
import 'package:langapp/components/frame/frame.dart';
import 'package:langapp/components/input_field/input_field.dart';
import 'package:langapp/components/logo/arrow.dart';
import 'package:langapp/components/logo/logo_mid.dart';
import 'package:langapp/styles/colors.dart';

class ResetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Frame(
      children: [
        // TODO: poprawnie skalibrować rozmieszczenie logo ze strzałką
        Arrow(
          child: LogoMid(),
          onPressed: () => Navigator.pop(context),
        ),
        Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 30.0),
                width: BTN_WIDTH,
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

            // TODO: Navigation
            // dialog information about sent message
            // properly working swap

            ButtonFilled(
              btnText: "Send",
              onPressed: () => Navigator.pop(context),
            ),
            const SizedBox(height: 30),
          ],
        )
      ],
    );
  }
}
