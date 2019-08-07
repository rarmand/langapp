import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:langapp/components/courses_list/course_box.dart';
import 'package:langapp/styles/colors.dart';

// TODO: scrollowanie
class CourseMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Block(
                  title: "Theory",
                  iconPath: "assets/course/all_vocab.svg",
                ),
                Block(
                  title: "Session",
                  iconPath: "assets/course/add.svg",
                ),
              ],
            ),
            SizedBox(height: 20.0),
            CourseBox(index: 0, type: true),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Block(
                  title: "Repetition",
                  iconPath: "assets/course/review_vocab.svg",
                ),
                Block(
                  title: "Test",
                  iconPath: "assets/course/test.svg",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Block extends StatelessWidget {
  final String title;
  final String iconPath;
  Widget icon;

  Block({this.title, this.iconPath}) {
    this.icon = SvgPicture.asset(
      this.iconPath,
      color: BROWN_DARK,
      // TODO: jak ustawić rozmiar?
      width: 60,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
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
            this.icon,
          ],
        ),
      ),
    );
  }
}
