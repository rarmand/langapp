import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class ElementButton extends StatelessWidget {
  final String name;
  final IconData buttonIcon;
  final Function onPressed;
  final bool disabled;
  Color _buttonColor = GREEN_LIGHT;

  ElementButton({
    @required this.name,
    @required this.buttonIcon,
    @required this.onPressed,
    this.disabled = false,
  }) {
    if (disabled) {
      this._buttonColor = GRAY;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      alignment: Alignment.centerLeft,
      child: FlatButton.icon(
        icon: Icon(this.buttonIcon, color: this._buttonColor),
        label: Text(
          this.name,
          style: TextStyle(
            color: this._buttonColor,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: this.onPressed,
      ),
    );
  }
}
