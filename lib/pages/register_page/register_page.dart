import 'package:flutter/material.dart';
import 'package:langapp/components/button_filled/button_filled.dart';
import 'package:langapp/components/frame/frame.dart';
import 'package:langapp/components/input_field/input_field.dart';
import 'package:langapp/components/logo/arrow.dart';
import 'package:langapp/components/logo/logo_mid.dart';
import 'package:langapp/styles/colors.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Frame(
      child: Form(
        key: this._formKey,
        child: IntrinsicHeight(
          child: Column(
            children: <Widget>[
              Arrow(
                child: LogoMid(),
                onPressed: () => Navigator.pop(context),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    InputField(label: "Username"),
                    InputField(label: "Email"),
                    InputField(label: "Password", isPassword: true),
                    Container(
                      width: BTN_WIDTH - 10,
                      child: Text(
                        "Password has to contain 10 characters: small letters, capital lettes, numbers",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                  ],
                ),
              ),
              ButtonFilled(
                btnText: "Sign up",
                onPressed: () => Navigator.pushNamed(context, '/welcome'),
              ),
              Container(
                width: BTN_WIDTH,
                child: Text(
                  "You agree to Langgarden’s Terms of Service and Privacy Policy.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 9),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
