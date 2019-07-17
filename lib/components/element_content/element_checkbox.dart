import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class ElementCheckbox extends StatelessWidget {
  bool isChecked;
  final String name;

  ElementCheckbox({@required this.isChecked, this.name = ""});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Row(
        children: <Widget>[
          Text(this.name),
          Checkbox(
            // TODO: naprawa , nadanie funkcji
            value: !this.isChecked,
            activeColor: BROWN_DARK,
          ),
        ],
      ),
    );
  }
}
