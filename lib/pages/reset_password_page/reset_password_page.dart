import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:langapp/components/button_filled/button_filled.dart';
import 'package:langapp/components/frame/frame.dart';
import 'package:langapp/components/input_field/input_field.dart';
import 'package:langapp/components/logo/arrow.dart';
import 'package:langapp/components/logo/logo_mid.dart';
import 'package:langapp/components/modals/reset_password_modal.dart';
import 'package:langapp/styles/colors.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Frame(
      child: Form(
        key: this._formKey,
        child: IntrinsicHeight(
          child: Column(
            children: [
              Arrow(
                child: LogoMid(),
                onPressed: () => Navigator.pop(context),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 40.0),
                      width: BTN_WIDTH,
                      child: Text(
                        "Please enter your email where we will send further instructions.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11,
                        ),
                      ),
                    ),
                    InputField(label: "Email"),
                  ],
                ),
              ),
              ButtonFilled(
                btnText: "Send",
                onPressed: () => Navigator.of(context).push(
                  PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (BuildContext context, _, __) => ResetPasswordModal(email: "thisemail@pocztex.se"),
                  ),
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
