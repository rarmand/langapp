import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FourthPage extends StatelessWidget {
  final Widget logo = SvgPicture.asset('assets/logo_small.svg');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Settings'),
        // TODO!
        leading: InkWell(
            child: Container(
              child: logo,
            ),
            onTap: () {
              print("click icon");
            }),
      ),
      body: Container(
          child: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                elevation: 0.0,
                color: Colors.transparent,
                textColor: Colors.white,
                child: Text(
                  "filled button",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: () {},
              ),
              RaisedButton(
                elevation: 0.0,
                color: Colors.transparent,
                textColor: Colors.white,
                child: Text(
                  "outlined button",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {},
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 25, 0, 30),
                child: Text(
                  "Don't want to sign up just yet? Try free!",
                ),
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'enter the future',
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
