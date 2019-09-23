import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class SmallInputField extends StatefulWidget {
  String text;
  final String label;
  Function onSaved;

  SmallInputField({
    @required this.text,
    @required this.label,
    @required this.onSaved,
  });

  @override
  _SmallInputFieldState createState() => _SmallInputFieldState();
}

class _SmallInputFieldState extends State<SmallInputField> {
  String _text = '';

  @override
  void initState() {
    super.initState();
    this._text = this.widget.text = this.widget.text.substring(0, this.widget.text.length - 1);
  }

  String _validator(String input) {
    int value = int.parse(input);

    print(value);
    if (value == null)
      return "No value";
    else if (value < 10 || value > 70) return "10% to 70%";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      child: TextFormField(
        initialValue: this._text,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        onSaved: (input) => this.widget.onSaved(input, this.widget.label),
        validator: this._validator,
        maxLength: 2,
        style: TextStyle(
          color: WHITE,
          fontSize: 22.0,
          fontFamily: "Roboto",
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          suffixText: "%",
          suffixStyle: TextStyle(
            color: WHITE,
            fontSize: 22.0,
            fontFamily: "Roboto",
            fontWeight: FontWeight.bold,
          ),
          counterText: "",
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: WHITE,
            ),
          ),
        ),
      ),
    );
  }
}
