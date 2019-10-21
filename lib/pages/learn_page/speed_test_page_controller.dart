import 'package:flutter/material.dart';
import 'package:langapp/components/appbar_upper/appbar_upper.dart';
import 'package:langapp/components/learning_process/learning_label.dart';
import 'package:langapp/pages/learn_page/speed_test_task_page.dart';
import 'package:langapp/components/modals/learning_choice_modal.dart';
import 'package:langapp/pages/learn_page/learning_final_page.dart';
import 'package:langapp/model/app_model.dart';
import 'package:langapp/pages/load_course_page/load_course_page.dart';
import 'package:scoped_model/scoped_model.dart';

class SpeedTestPageController extends StatefulWidget {
  // TODO: naprawić położenie klocka z testem
  @override
  _SpeedTestPageControllerState createState() => _SpeedTestPageControllerState();
}

class _SpeedTestPageControllerState extends State<SpeedTestPageController> {
  Map<String, Widget> _finalTasks = {};
  PageController pageController = PageController();
  int _selectedIndex = 0;
  List _pages = [];
  int _strike = 0;
  int _revives = 3;
  final int _pointsForTask = 20;

  @override
  void initState() {
    super.initState();
    // prepared words to learn
    ScopedModel.of<UserModel>(context).iconProcessPath = "assets/course/test.svg";

    ScopedModel.of<UserModel>(context).counterSpeedTestStrike = this._strike;
    ScopedModel.of<UserModel>(context).processPoints = 0;

    ScopedModel.of<UserModel>(context).setSpeedTestRevives(revives: this._revives);
    ScopedModel.of<UserModel>(context).setWordsForSpeedTest();
    this._generateTasks();
  }

  void _nextPage(bool successed) {
    if (successed) {
      this._strike += 1;

      ScopedModel.of<UserModel>(context).counterSpeedTestStrike = this._strike;
      ScopedModel.of<UserModel>(context).addToProcessPoints(this._pointsForTask);
    } else {
      this._revives -= 1;
      ScopedModel.of<UserModel>(context).setSpeedTestRevives(revives: this._revives);

      if (this._revives == 0) {
        pageController.animateToPage(this._pages.length - 1,
            duration: const Duration(milliseconds: 250), curve: Curves.easeIn);
        return;
      }
    }
    pageController.nextPage(duration: const Duration(milliseconds: 250), curve: Curves.easeIn);
  }

  void _generateTasks() {
    Map wordsSpeedTest = ScopedModel.of<UserModel>(context).wordsSpeedTest;

    // gdy nie ma już słów do nauki
    if (wordsSpeedTest.length == 0) {
      this._finalTasks['final'] = LearningFinalPage(noWordsToLearn: true, type: "test");
      this._pages = this._finalTasks.values.toList();
      return;
    }

    wordsSpeedTest.forEach((wordKey, word) {
      this._finalTasks[wordKey] = SpeedTestTask(
        wordKey: wordKey,
        word: word,
        onNext: this._nextPage,
      );
    });

    final List pages = this._finalTasks.values.toList();
    pages.shuffle();

    pages.add(LearningFinalPage(type: "test"));
    this._pages = pages;
  }

  // app bar actions
  void _onClosePressed() {
    Navigator.pushNamedAndRemoveUntil(context, "/", (Route<dynamic> route) => false);
    Navigator.of(context).push(PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __) => LearningChoiceModal(),
    ));
  }

  void _onLogoTap() {
    Navigator.pushNamedAndRemoveUntil(context, "/", (Route<dynamic> route) => false);
  }

  // build
  @override
  Widget build(BuildContext context) {
    String courseTitle = ScopedModel.of<UserModel>(context, rebuildOnChange: true).chosenCourse['title'];
    if (courseTitle == null) courseTitle = "Course Title";

    return Scaffold(
      appBar: AppBarUpper(
        title: courseTitle,
        isCourseAppBar: true,
        onLogoTap: this._onLogoTap,
        onClosePressed: this._onClosePressed,
      ),
      body: FutureBuilder(
        future: this._loadWidget(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return LoadCoursePage();
          }

          return Container(
            child: Column(
              children: <Widget>[
                LearningLabel(point: this._selectedIndex, points: this._pages.length - 1),
                Expanded(
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: this._pages.length,
                    onPageChanged: (index) => setState(() => this._selectedIndex = index),
                    itemBuilder: (context, index) => this._pages[index],
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<bool> _loadWidget(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));
    return true;
  }
}
