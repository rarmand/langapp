import 'package:flutter/material.dart';
import 'package:langapp/components/ButtonFilled/main.dart';
import 'package:langapp/components/ButtonOutlined/main.dart';
import 'package:langapp/components/Dots/main.dart';
import 'package:langapp/components/Logo/logoBig.dart';

class TrdIntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              LogoBig(),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 30),
                    ButtonFilled(
                      btnText: "Sign up",
                    ),
                    ButtonOutlined(btnText: "I have an account"),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 25, 0, 30),
                      child: Text(
                        "Try the app for free!",
                        style: TextStyle(
                          color: Color(0xFF6D4C41),
                          fontSize: 12,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
                child: Dots(chosen: 2),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
