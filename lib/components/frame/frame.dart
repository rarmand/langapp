import 'package:flutter/material.dart';

class Frame extends StatelessWidget {
  Widget child;

  Frame({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              this.child,
            ],
          ),
        ),
      ),
    );
  }
}
