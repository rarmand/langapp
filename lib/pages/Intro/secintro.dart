import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:langapp/components/Dot/index.dart';

class IntroPage extends StatelessWidget {
  final Widget logo = Column(
    children: <Widget>[
      SvgPicture.asset('assets/logo.svg'),
      SvgPicture.asset('assets/logo_text.svg'),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                  child: logo,
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                    width: 196,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10.0, 0, 15.0),
                          child: Text(
                            "Our application will help you\nto diagnose your skills:",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Color.fromRGBO(109, 76, 65, 1),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10.0, 0, 15.0),
                          child: Text(
                            "listening, reading\nspeaking and writing.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(109, 76, 65, 1),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10.0, 0, 15.0),
                          child: Text(
                            "This will give you the best recipe for\nfuture learning process.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Color.fromRGBO(109, 76, 65, 1),
                            ),
                          ),
                        ),
                      ],
                    )),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  width: 64.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Dot(false),
                      Dot(true),
                      Dot(false),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
