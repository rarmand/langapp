import 'package:flutter/material.dart';
import 'package:langapp/components/ButtonOutlined/main.dart';
import 'package:langapp/components/Logo/arrow.dart';
import 'package:langapp/components/Logo/logoSmall.dart';

class WelcomeFrame extends StatelessWidget {
  final Widget child;
  final Widget title;
  final double bottomHeight;
  final bool logoWithArrow;

  WelcomeFrame({@required this.child, @required this.title, this.bottomHeight = 45, this.logoWithArrow = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              (logoWithArrow ? Arrow(child: LogoSmall()) : LogoSmall()),
              title,
              this.child,
              SizedBox(height: this.bottomHeight),
              ButtonOutlined(btnText: "Next"),
            ],
          ),
        ),
      ),
    );
  }
}
