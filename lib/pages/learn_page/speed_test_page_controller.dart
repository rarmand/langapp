import 'package:flutter/material.dart';
import 'package:langapp/components/appbar_upper/appbar_upper.dart';
import 'package:langapp/components/learning_process/learning_label.dart';
import 'package:langapp/model/app_model.dart';
import 'package:langapp/pages/learn_page/text_task_choose_word.dart';
import 'package:scoped_model/scoped_model.dart';

class SpeedTestPageController extends StatefulWidget {
  // TODO: naprawić położenie klocka z testem
  @override
  _SpeedTestPageControllerState createState() => _SpeedTestPageControllerState();
}

class _SpeedTestPageControllerState extends State<SpeedTestPageController> {
  List<Widget> _finalTasks = [
    TextTaskChooseWord(),
    TextTaskChooseWord(),
    TextTaskChooseWord(),
    TextTaskChooseWord(),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    String courseTitle = ScopedModel.of<UserModel>(context, rebuildOnChange: true).chosenCourse['title'];

    return Scaffold(
      appBar: AppBarUpper(
        title: courseTitle,
        isCourseAppBar: true,
        onLogoTap: () => Navigator.pushNamedAndRemoveUntil(context, "/", (Route<dynamic> route) => false),
        onClosePressed: () => Navigator.pushNamedAndRemoveUntil(context, "/", (Route<dynamic> route) => false),
      ),
      body: Stack(
        children: <Widget>[
          PageView(
            children: this._finalTasks,
            onPageChanged: (int index) => setState(() => this._selectedIndex = index),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: LearningLabel(point: this._selectedIndex, points: this._finalTasks.length - 1),
          ),
        ],
      ),
    );
  }
}
