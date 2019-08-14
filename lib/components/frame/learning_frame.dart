import 'package:flutter/material.dart';
import 'package:langapp/components/appbar_upper/appbar_upper.dart';
import 'package:langapp/components/learning_process/learning_label.dart';

class LearningFrame extends StatelessWidget {
  final String courseTitle;
  Widget child;
  int point;

  LearningFrame({@required this.courseTitle = "Title", @required this.child, this.point = 4});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUpper(
        title: this.courseTitle,
        isCourseAppBar: true,
        onLogoTap: () => Navigator.pushNamedAndRemoveUntil(context, "/", (Route<dynamic> route) => false),
        onClosePressed: () => Navigator.pushNamedAndRemoveUntil(context, "/", (Route<dynamic> route) => false),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LearningLabel(point: this.point),
              Container(
                margin: EdgeInsets.fromLTRB(24, 0, 24, 0),
                child: this.child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
