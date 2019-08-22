import 'package:flutter/material.dart';
import 'package:langapp/components/button_filled/button_square.dart';
import 'package:langapp/styles/colors.dart';

class StopLearningProcessModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE.withOpacity(0.95),
      body: GestureDetector(
        // onTap: () => Navigator.pop(context),
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 24.0),
                Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 16.0),
                      Text(
                        "Do you want to break the learning process?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(height: 24.0),
                      Text(
                        "Achieved points will be saved.",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 24.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ButtonSquare(positive: false, onPressed: () {}),
                          ButtonSquare(positive: true, onPressed: () {}),
                        ],
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(32.0),
                  margin: EdgeInsets.symmetric(horizontal: 32.0),
                  decoration: BoxDecoration(
                    color: WHITE,
                    borderRadius: BorderRadius.circular(
                      BTN_RADIUS,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: BROWN_SHADOW_25,
                        offset: Offset(0, SHADOW_OFFSET),
                        blurRadius: SHADOW_RADIUS,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 24.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
