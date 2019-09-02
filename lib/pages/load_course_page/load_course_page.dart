import 'package:flutter/material.dart';
import 'package:langapp/components/bubble/bubbles.dart';
import 'package:langapp/styles/colors.dart';

// proces ładowania się danych z bazy do nauki
// TODO: widok do poprawy, więcej space od góry, dostosować do Frame, żeby działało scrollowanie
class LoadCoursePage extends StatelessWidget {
  final String courseChoice;
  final String courseName;

  LoadCoursePage({@required this.courseChoice, @required this.courseName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [GREEN_LIGHT, GREEN_DARK],
          ),
        ),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // TODO: animacja bloczków kółeczek,
              Bubbles(),
              // tekst pozostały
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
      ),
    );
  }
}
