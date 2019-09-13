import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:langapp/components/courses_list/course_box.dart';
import 'package:langapp/components/frame/menu_frame.dart';
import 'package:langapp/components/panel_points/panel_points.dart';
import 'package:langapp/model/app_model.dart';
import 'package:scoped_model/scoped_model.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _coursesList = [];

  @override
  void initState() {
    super.initState();
    this._getData();
  }

  void _getData() async {
    String userId = ScopedModel.of<UserModel>(context).userId;
    DocumentSnapshot ds = await Firestore.instance.collection('users').document(userId).get();

    int userPoints = 0;

    if (ds.exists) {
      List courses = ds.data['courses'];

      if (courses.length > 0) {
        List<Widget> list = [];
        for (int i = 0; i < courses.length; i++) {
          userPoints += courses[i]['points'];
          list.add(CourseBox(
            index: i,
            isNewCourse: false,
          ));
        }
        setState(() {
          _coursesList = list;
        });

        ScopedModel.of<UserModel>(context).setPoints(points: userPoints);
      }
    } else
      setState(() {
        _coursesList = [];
      });
  }

  @override
  Widget build(BuildContext context) {
    return MenuFrame(
        title: "Home",
        child: Column(
          children: <Widget>[
            PanelPoints(),
            SizedBox(height: 24.0),
            Wrap(
              runSpacing: 24.0,
              children: this._coursesList,
            ),
            SizedBox(height: 24.0),
          ],
        ));
  }
}
