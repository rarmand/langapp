import 'package:flutter/material.dart';
import 'package:langapp/components/courses_list/course_flag.dart';
import 'package:langapp/components/courses_list/course_type.dart';

import 'course_title.dart';

class CourseHeader extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.0, left: 16.0),
      child: Row(
        children: <Widget>[
          CourseFlag(),
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CourseTitle(),
                CourseType(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
