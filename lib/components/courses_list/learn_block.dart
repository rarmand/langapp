import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:langapp/styles/colors.dart';

class LearnBlock extends StatelessWidget {
  final String title;
  final String iconPath;
  String _pagePath;
  Widget _icon;

  LearnBlock({this.title, this.iconPath}) {
    this._icon = SvgPicture.asset(
      this.iconPath,
      color: BROWN_DARK,
      width: 60,
    );

    if (this.title == "Theory")
      _pagePath = '/theory';
    else if (this.title == "Test")
      _pagePath = "/test";
    else
      _pagePath = "/session";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(this._pagePath),
      child: Container(
        height: MediaQuery.of(context).size.width / 3,
        width: MediaQuery.of(context).size.width / 3,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(BTN_RADIUS)),
          // TODO: można poprawić gradient i ustawić jako osobny komponent
          gradient: LinearGradient(
            colors: <Color>[
              YELLOW,
              YELLOW.withAlpha(255),
            ],
          ),
          // TODO: boxshadow mozna dodać jako uniwersalny komponent, często używane
          boxShadow: [
            BoxShadow(
              color: BROWN_SHADOW_25,
              offset: Offset(0, SHADOW_OFFSET / 2),
              blurRadius: SHADOW_RADIUS,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              this.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            this._icon,
          ],
        ),
      ),
    );
  }
}
