import 'package:flutter/material.dart';
import 'package:langapp/components/courses_list/course_flag.dart';
import 'package:langapp/components/courses_list/course_title.dart';
import 'package:langapp/components/courses_list/course_type.dart';

class CourseHeader extends StatelessWidget {
  final String title;
  final String type;
  final String language;

  CourseHeader({@required this.title, this.type = '', this.language = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.0),
      child: Row(
        children: <Widget>[
          CourseFlag(language: this.language),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CourseTitle(title: this.title),
                CourseType(type: this.type),
              ],
            ),
          )
        ],
      ),
    );
  }
}
