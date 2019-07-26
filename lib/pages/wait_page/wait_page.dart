import 'package:flutter/material.dart';
import 'package:langapp/components/frame/frame.dart';
import 'package:langapp/styles/colors.dart';

// proces ładowania się danych z bazy do nauki
// TODO: widok do poprawy, więcej space od góry, dostosować do Frame, żeby działało scrollowanie
class WaitPage extends StatelessWidget {
  final String courseChoice;
  final String courseName;

  WaitPage({@required this.courseChoice, @required this.courseName});
  @override
  Widget build(BuildContext context) {
    return Frame(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [GREEN_LIGHT, GREEN_DARK],
            ),
          ),
          child: Column(
            children: <Widget>[
              // TODO: animacja bloczków kółeczek,
              Container(
                height: MediaQuery.of(context).size.height / 3 * 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Bubble(
                      title: "3",
                      radius: 60.0,
                      fontSize: 32.0,
                    ),
                    SizedBox(height: 20.0),
                    Bubble(
                      title: "2",
                      radius: 45.0,
                      fontSize: 28.0,
                    ),
                    SizedBox(height: 20.0),
                    Bubble(
                      title: "1",
                      radius: 30.0,
                      fontSize: 22.0,
                    ),
                  ],
                ),
              ),
              Text(
                this.courseChoice,
                style: TextStyle(
                  color: WHITE,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                this.courseName,
                style: TextStyle(
                  color: WHITE,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                "Good luck and have fun!",
                style: TextStyle(
                  color: WHITE,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Bubble extends StatelessWidget {
  final String title;
  final double radius;
  final double fontSize;

  Bubble({@required this.title, @required this.radius, @required this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        this.title,
        style: TextStyle(
          fontFamily: "Roboto",
          fontSize: this.fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
      height: this.radius * 2,
      width: this.radius * 2,
      decoration: BoxDecoration(
        color: WHITE,
        borderRadius: BorderRadius.all(
          Radius.circular(this.radius),
        ),
        boxShadow: [
          BoxShadow(
            color: BROWN_SHADOW_25,
            offset: Offset(0, SHADOW_OFFSET / 2),
            blurRadius: SHADOW_RADIUS,
          ),
        ],
      ),
    );
  }
}
