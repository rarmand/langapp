import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/main_btn/main_btn.dart';

class IntroPage extends StatelessWidget {
  final Widget logo = Column(
    children: <Widget>[
      SvgPicture.asset('assets/logo.svg'),
      SvgPicture.asset('assets/logo_text.svg'),
    ],
  );

  final Widget dots = SvgPicture.asset('assets/dots.svg');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                child: logo,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 84, 0, 0),
                child: SizedBox(
                  width: 196,
                  child: Text(
                    "Test your abilities\nand\nlearn foreign languages!",
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    style: TextStyle(
                      fontSize: 16.0,
                      //fontFamily: "MerriweatherSans",
                      color: Color.fromRGBO(109, 76, 65, 1),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                child: dots,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
