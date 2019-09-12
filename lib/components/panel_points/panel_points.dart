import 'package:flutter/material.dart';
import 'package:langapp/components/panel_points/block_points.dart';
import 'package:langapp/components/panel_points/buttons_course.dart';
import 'package:langapp/model/app_model.dart';
import 'package:langapp/styles/colors.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PanelPoints extends StatefulWidget {
  @override
  _PanelPointsState createState() => _PanelPointsState();
}

class _PanelPointsState extends State<PanelPoints> {
  bool _isPanelExpanded = false;
  int _points = 0;

  // TODO: zwijanie animacja
  // do naprawy setState
  void onPressedArrow() {
    String userUid = ScopedModel.of<UserModel>(context).userId;
    print(userUid);
    
    Firestore.instance.collection("users").document(userUid).get().then((DocumentSnapshot ds) {
      int dataPoints = 0;

      if (ds.exists) {
        List coursesTable = ds.data['courses'];

        if (coursesTable.length > 0)
          coursesTable.forEach((course) {
            dataPoints += course['points'];
          });
      }

      setState(() => this._points = dataPoints);
    });

    setState(() => this._isPanelExpanded = !this._isPanelExpanded);
  }

  @override
  Widget build(BuildContext context) {
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
      child: (this._isPanelExpanded
          ? Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: <Widget>[
                  BlockPoints(points: this._points),
                  Text("Choose a course, repeat material and win more points."),
                  ButtonsCourse(),
                  IconButton(
                    icon: Icon(Icons.keyboard_arrow_up, color: BROWN_DARK),
                    onPressed: this.onPressedArrow,
                  ),
                ],
              ),
            )
          : Container(
              margin: EdgeInsets.fromLTRB(16.0, 28.0, 16.0, 0.0),
              child: Column(
                children: [
                  Text("Choose a course, repeat material and win more points."),
                  const SizedBox(height: 20.0),
                  IconButton(
                    icon: Icon(Icons.keyboard_arrow_down, color: BROWN_DARK),
                    onPressed: this.onPressedArrow,
                  ),
                ],
              ),
            )),
    );
  }
}
