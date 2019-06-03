import 'package:flutter/material.dart';

class Dot extends StatelessWidget {
  final bool chosen;

  Dot(this.chosen);

  @override
  Widget build(BuildContext context) {
    Widget circle = new Container(
      width: 8.0,
      height: 8.0,
      decoration: new BoxDecoration(
        color: (chosen ? Color(0xff1bb000) : Color.fromRGBO(109, 76, 65, 0.25)),
        shape: BoxShape.circle,
      ),
    );

    return Container(
        child: Padding(
      padding: EdgeInsets.all(6.0),
      child: Center(
        child: Stack(
          children: <Widget>[circle],
        ),
      ),
    ));
  }
}
