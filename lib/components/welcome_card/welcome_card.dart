import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class WelcomeCard extends StatelessWidget {
  final String title;
  final Widget img;
  final String route;

  WelcomeCard({@required this.title, @required this.img, @required this.route});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // TODO: jak zablokować powrót gdy już przejdę do DAILY GOAL?
      onTap: () => Navigator.pushNamed(context, this.route),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        width: MediaQuery.of(context).size.width * 0.64,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 16.0),
            this.img,
            Text(
              this.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: WHITE,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(BTN_RADIUS)),
          gradient: LinearGradient(
            colors: <Color>[
              GREEN_DARK,
              GREEN_LIGHT,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: BROWN_SHADOW_25,
              offset: Offset(0, SHADOW_OFFSET / 2),
              blurRadius: SHADOW_RADIUS,
            ),
          ],
        ),
      ),
    );
  }
}
