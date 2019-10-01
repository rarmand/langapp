import 'package:flutter/material.dart';
import 'package:langapp/components/frame/learning_frame.dart';
import 'package:langapp/styles/colors.dart';

class SpeedTestMenuTest extends StatelessWidget {
  // TODO: naprawić położenie klocka z testem
  @override
  Widget build(BuildContext context) {
    return LearningFrame(
      title: '',
      point: 0,
      child: Container(
        height: MediaQuery.of(context).size.height * 6 / 7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 182.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(BTN_RADIUS)),
                gradient: LinearGradient(
                  colors: <Color>[
                    GREEN_DARK,
                    GREEN_LIGHT,
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
                children: [
                  Text(
                    "Speed Test",
                    style: TextStyle(
                      color: WHITE,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Test yourself in 5 seconds!",
                    style: TextStyle(
                      color: WHITE,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 182.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(BTN_RADIUS)),
                gradient: LinearGradient(
                  colors: <Color>[
                    YELLOW,
                    YELLOW.withRed(255),
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
                children: [
                  Text(
                    "Speed Contest",
                    style: TextStyle(
                      color: BROWN_LIGHT,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Try yourself with other users",
                    style: TextStyle(
                      color: BROWN_LIGHT,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
