import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class ElementCheckbox extends StatefulWidget {
  String name = "";
  bool isChecked = false;
  Function onChanged = (bool val) {};

  ElementCheckbox({@required this.name, this.isChecked, this.onChanged});

  @override
  _ElementCheckboxState createState() => _ElementCheckboxState();
}

class _ElementCheckboxState extends State<ElementCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Row(
        children: <Widget>[
          Text(this.widget.name),
          Checkbox(
            // TODO: naprawa , nadanie funkcji
            value: this.widget.isChecked,
            activeColor: BROWN_DARK,
            onChanged: this.widget.onChanged,
          ),
        ],
      ),
    );
  }
}
