import 'package:flutter/material.dart';

class Frame extends StatelessWidget {
  List<Widget> children;

  Frame({@required this.children});

// TODO: dodać logo główne i strzałki jako part of frame
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: this.children,
          ),
        ),
      ),
    );
  }
}
