import 'package:flutter/material.dart';
import 'package:langapp/components/Dots/main.dart';
import 'package:langapp/components/Logo/main.dart';

class TrdIntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              LogoBig(),
              const SizedBox(height: 30),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 30),
                    Container(
                      width: 250,
                      height: 50,
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF18AB00),
                            Color(0xFF38D900),
                          ],
                        ),
                      ),
                      child: RaisedButton(
                        elevation: 0.0,
                        color: Colors.transparent,
                        textColor: Colors.white,
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      width: 250,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        border: Border.all(
                          color: Color(0xFF6D4C41),
                        ),
                      ),
                      child: RaisedButton(
                        elevation: 0.0,
                        color: Colors.transparent,
                        textColor: Color(0xFF6D4C41),
                        child: Text(
                          "I have an account",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 25, 0, 30),
                      child: Text(
                        "Don't want to sign up just yet? Try free!",
                        style: TextStyle(
                          color: Color(0xFF6D4C41),
                          fontSize: 12,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
                child: Dots(chosen: 2),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
