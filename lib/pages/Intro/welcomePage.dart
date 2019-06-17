import 'package:flutter/material.dart';
import 'package:langapp/components/Logo/main.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              LogoBig(),
              Text("Welcome in progress..."),
            ],
          ),
        ),
      ),
    );
  }
}
