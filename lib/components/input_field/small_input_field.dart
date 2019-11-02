import 'package:flutter/material.dart';
import 'package:langapp/model/app_model.dart';
import 'package:langapp/styles/colors.dart';
import 'package:scoped_model/scoped_model.dart';

class SmallInputField extends StatefulWidget {
  String text;
  final String label;

  SmallInputField({
    @required this.text,
    @required this.label,
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

  void _onSaved(String input) {
    int value = int.parse(input);
    print(this.widget.label + " " + input);
    ScopedModel.of<UserModel>(context).setSkillUser(key: this.widget.label, value: value);
  }

  String _validator(String input) {
    int value = int.parse(input);

    if (value == null)
      return "No value";
    else if (value < 10 || value > 70)
      return "10% to 70%";
    else {
      ScopedModel.of<UserModel>(context).setNewSkillsetUser(key: this.widget.label, value: value);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      child: TextFormField(
        initialValue: this._text,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        onSaved: this._onSaved,
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
