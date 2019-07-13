import 'package:flutter/material.dart';

class ElementTitle extends StatelessWidget {
  final String title;

  ElementTitle({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Text(
        this.title,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
