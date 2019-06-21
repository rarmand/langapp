import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class WelcomeCard extends StatelessWidget {
  final String title;
  final Widget img;

  WelcomeCard({@required this.title, @required Widget this.img});

  @override
  Widget build(BuildContext context) {
    // TODO: czy jest sens używać CARD
    // do wycięcia jako osobny Component
    // jako duży MAIN i małe BACKGROUND
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(btnRadius),
      ),
      child: Container(
        height: btnWidth,
        width: btnWidth - 50,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 40),
            Text(
              this.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(btnRadius)),
          gradient: LinearGradient(
            colors: <Color>[
              Color(GREEN_DARK),
              Color(GREEN_LIGHT),
            ],
          ),
        ),
      ),
    );
  }
}
