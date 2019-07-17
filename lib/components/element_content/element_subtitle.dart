import 'package:flutter/material.dart';

class ElementSubtitle extends StatelessWidget {
  final String subtitle;

  ElementSubtitle({@required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Text(
        this.subtitle,
        style: TextStyle(),
      ),
    );
  }
}
