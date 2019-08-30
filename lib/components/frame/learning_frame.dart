import 'package:flutter/material.dart';
import 'package:langapp/components/learning_process/learning_label.dart';

class LearningFrame extends StatelessWidget {
  Widget child;
  int point;

  LearningFrame({@required this.child, this.point = 4});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // LearningLabel(point: this.point),
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
