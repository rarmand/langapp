import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:langapp/components/courses_list/courses_list.dart';
import 'package:langapp/components/frame/menu_frame.dart';

// TODO: scrollowanie na marginesach w landscape nie działa
class HomePage extends StatelessWidget {
  final String title;

  HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuFrame(title: "Home", child: CoursesList());
  }
}
