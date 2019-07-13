import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class Dots extends StatelessWidget {
  final int chosen;
  final List<Dot> dotsRow = new List<Dot>();

  Dots({@required this.chosen}) {
    for (var i = 0; i < 3; i++) {
      if (chosen == i)
        dotsRow.add(new Dot(chosen: true));
      else
        dotsRow.add(new Dot());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: dotsRow,
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final bool chosen;

  Dot({this.chosen: false});

  @override
  Widget build(BuildContext context) {
    Widget circle = new Container(
      width: 8.0,
      height: 8.0,
      decoration: new BoxDecoration(
        color: (this.chosen ? GREEN_DARK : GRAY),
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
