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
  List<String> _coursesList = [];

  @override
  void initState() {
    super.initState();
    this._getData();
  }

  void _getData() async {
    List<String> list = [];
    await ScopedModel.of<UserModel>(context).setUserData();
    Map courses = ScopedModel.of<UserModel>(context).courses;

    if (courses.length > 0) {
      courses.forEach((index, dataMap) {
        list.add(index);
      });
    }

    setState(() {
      _coursesList = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MenuFrame(
        title: "Home",
        child: Column(
          children: <Widget>[
            PanelPoints(),
            const SizedBox(height: 24.0),
            Wrap(
              runSpacing: 24.0,
              children: this
                  ._coursesList
                  .map((index) => CourseBox(
                        index: index,
                      ))
                  .toList(),
            ),
            const SizedBox(height: 24.0),
          ],
        ));
  }
}
