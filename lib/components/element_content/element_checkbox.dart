import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class ElementCheckbox extends StatefulWidget {
  final String name;

  ElementCheckbox({this.name = ""});

  @override
  _ElementCheckboxState createState() => _ElementCheckboxState(
        name: this.name,
      );
}

class _ElementCheckboxState extends State<ElementCheckbox> {
  bool _isChecked = false;
  final String name;

  _ElementCheckboxState({this.name = ""});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Row(
        children: <Widget>[
          Text(this.name),
          Checkbox(
            // TODO: naprawa , nadanie funkcji
            value: this._isChecked,
            activeColor: BROWN_DARK,
            onChanged: (val) => setState(() => _isChecked = val),
          ),
        ],
      ),
    );
  }
}
