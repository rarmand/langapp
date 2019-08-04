import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:langapp/components/button_filled/button_filled.dart';
import 'package:langapp/components/button_outlined/button_outlined.dart';
import 'package:langapp/components/frame/frame.dart';
import 'package:langapp/components/input_field/input_field.dart';
import 'package:langapp/components/logo/logo_mid.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Frame(
      children: <Widget>[
        LogoMid(),
        Container(
          child: Column(
            children: <Widget>[
              InputField(title: "Email"),
              InputField(
                title: "Password",
                isPassword: true,
              ),
              InkWell(
                child: Text(
                  "Forgot password?",
                  style: TextStyle(
                    fontSize: 11,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onTap: () => Navigator.of(context).pushNamed('/reset_password'),
              ),
            ],
          ),
        ),
        Column(
          children: <Widget>[
            const SizedBox(height: 60),
            ButtonFilled(
              btnText: "Sign in",
              onPressed: () => Navigator.pushNamed(context, '/'),
            ),
            ButtonOutlined(
              btnText: "Sign up",
              onPressed: () => Navigator.pushNamed(context, '/register'),
            ),
            const SizedBox(height: 30),
          ],
        )
      ],
    );
  }
}
