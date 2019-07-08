import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

import 'block_points.dart';
import 'buttons_course.dart';

class PanelPoints extends StatelessWidget {
  bool expandedPanel = false;

  @override
  Widget build(BuildContext context) {
    // TODO: zwijanie
    return Container(
      decoration: BoxDecoration(
        color: WHITE,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(BTN_RADIUS),
          bottomRight: Radius.circular(BTN_RADIUS),
        ),
        boxShadow: [
          BoxShadow(
            color: BROWN_SHADOW_25,
            offset: Offset(0, SHADOW_OFFSET),
            blurRadius: SHADOW_RADIUS,
          ),
        ],
      ),
      padding: EdgeInsets.only(bottom: BTN_RADIUS),
      child: (expandedPanel
          ? Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: <Widget>[
                  BlockPoints(),
                  Text("Choose a course, repeat material and win more points."),
                  ButtonsCourse(),
                  Icon(Icons.keyboard_arrow_up, color: BROWN_DARK),
                ],
              ),
            )
          : Container(
              margin: EdgeInsets.fromLTRB(16.0, 28.0, 16.0, 0.0),
              child: Column(
                children: [
                  Text("Choose a course, repeat material and win more points."),
                  const SizedBox(height: 20.0),
                  Icon(Icons.keyboard_arrow_down, color: BROWN_DARK),
                ],
              ),
            )),
    );
  }
}
