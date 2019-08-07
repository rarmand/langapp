import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

// TODO: scrollowanie
// TODO: zablokować background , zeby nic tam nie dzialalo po nacisnięciu, tylko wróciło do poprzedniej strony
class ResetPasswordModal extends StatelessWidget {
  final String email;

  ResetPasswordModal({@required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE.withOpacity(0.95),
      body: GestureDetector(
        onTap: () => Navigator.popAndPushNamed(context, "/login"),
        child: Container(
          padding: EdgeInsets.all(36.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Recovery instructions will be sent soon on a given email:",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.0),
              Text(
                this.email,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: GREEN_LIGHT,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
