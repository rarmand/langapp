import 'package:flutter/material.dart';
import 'package:langapp/components/ButtonOutlined/main.dart';
import 'package:langapp/components/Logo/logoSmall.dart';

class WelcomeFrame extends StatelessWidget {
  final Widget child;
  final String title;

  WelcomeFrame({@required Widget this.child, @required String this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              LogoSmall(),
              Text(
                this.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              this.child,
              ButtonOutlined(btnText: "Next"),
            ],
          ),
        ),
      ),
    );
  }
}
