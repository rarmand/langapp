import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:langapp/components/courses_list/courses_list.dart';
import 'package:langapp/components/frame/frame.dart';

// TODO: scrollowanie na marginesach w landscape nie działa
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Frame(title: "Home", chosen: 0, child: CoursesList());
  }
}
