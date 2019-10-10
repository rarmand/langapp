import 'dart:math';

import 'package:flutter/material.dart';
import 'package:langapp/components/appbar_upper/appbar_upper.dart';
import 'package:langapp/components/learning_process/learning_label.dart';
import 'package:langapp/components/learning_process/points_label.dart';
import 'package:langapp/model/app_model.dart';
import 'package:langapp/pages/learn_page/learning_final_page.dart';
import 'package:langapp/pages/learn_page/new_word_page.dart';
import 'package:langapp/pages/learn_page/sound_task_choose_word.dart';
import 'package:langapp/pages/learn_page/sound_task_write_word.dart';
import 'package:langapp/pages/learn_page/text_task_assemble_word.dart';
import 'package:langapp/pages/learn_page/text_task_choose_sound.dart';
import 'package:langapp/pages/learn_page/text_task_choose_word.dart';
import 'package:langapp/pages/learn_page/text_task_speak_word.dart';
import 'package:langapp/pages/learn_page/text_task_write_word.dart';
import 'package:scoped_model/scoped_model.dart';

class LearnPageController extends StatefulWidget {
  @override
  _LearnPageControllerState createState() => _LearnPageControllerState();
}

class _LearnPageControllerState extends State<LearnPageController> {
  // EXAMPLE SETUP
  // number of words to learn for this session
  final int _numberOfWords = 3;
  // number of tasks to do for this session
  final int _numberOfTasks = 10;
  // points to collect during one session
  // points are on the end added to UserModel points
  int _points = 0;

  // list to collect initialized objects of pages
  List<Widget> _finalTasks = [];

  // page controller needed for BUILD function to create a VIEW
  PageController pageController = PageController();
  // index for BUILD
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // prepared words to learn
    ScopedModel.of<UserModel>(context).iconProcessPath = "assets/course/add.svg";
    ScopedModel.of<UserModel>(context).setWordsToLearn(amount: this._numberOfWords);

    // wybrany kurs (usermodel - chosenCourse)
    // na start lista wszystkich słów dla danego kursu (typ Map w UserModel - chosenCourseWords)
    // lista słow już widzianych (learntWords - typ Map)
    // lista słow do powtórzenia (wordsToRepeat - typ Map)
    // lista słow zignorowanych (wordsIgnored)
    // pobieranie słow do nauki (wordsToLearn)
    // skillset (skillsetUser , skillsetDiagnosed, czy jest auto : skillsetDiagnosed )

    // generated list of tasks for one session
    this._generateTasks();
  }

  Map _getSkillset() {
    // EXAMPLE
    // 10 tasks for one session
    // 4 for image and translation of new word
    Map skillset = {'reading': 30, 'listening': 30, 'writing': 30, 'speaking': 10};

    if (ScopedModel.of<UserModel>(context).autoSkillset) {
      skillset.forEach((skill, value) {
        if (ScopedModel.of<UserModel>(context).skillsetDiagnosed.containsKey(skill)) {
          skillset[skill] = ScopedModel.of<UserModel>(context).skillsetDiagnosed[skill];
        }
      });
    } else {
      skillset.forEach((skill, value) {
        if (ScopedModel.of<UserModel>(context).skillsetUser.containsKey(skill)) {
          skillset[skill] = ScopedModel.of<UserModel>(context).skillsetUser[skill];
        }
      });
    }

    return skillset;
  }

  Widget _getLearningTask(String type, Map word) {
    switch (type) {
      case 'speaking':
        return TextTaskSpeakWord(
          word: word,
          onNext: this._nextPage,
        );
      case 'listening':
        {
          final int rand = Random().nextInt(2);
          Widget result;
          if (rand == 0)
            result = TextTaskChooseSound(
              word: word,
              onNext: this._nextPage,
            );
          else
            result = SoundTaskChooseWord(
              word: word,
              onNext: this._nextPage,
            );
          return result;
        }
      case 'reading':
        {
          final int rand = Random().nextInt(2);
          Widget result;
          if (rand == 0)
            result = TextTaskAssembleWord(
              word: word,
              onNext: this._nextPage,
            );
          else
            result = TextTaskChooseWord(
              word: word,
              onNext: this._nextPage,
            );
          return result;
        }
      case 'writing':
        {
          final int rand = Random().nextInt(2);
          Widget result;
          if (rand == 0)
            result = SoundTaskWriteWord(
              word: word,
              onNext: this._nextPage,
            );
          else
            result = TextTaskWriteWord(
              word: word,
              onNext: this._nextPage,
            );
          return result;
        }
      default:
        return null;
    }
  }

  void _nextPage(bool successed) async {
    if (successed) {
      ScopedModel.of<UserModel>(context).addToProcessPoints = 50;
    } else {
      // nie wiem co, nie daj punktu
    }
    pageController.nextPage(duration: const Duration(milliseconds: 250), curve: Curves.easeIn);
  }

  void _generateTasks() {
    //////////////////////////////////////////////////////////////////////////////

    Map skillset = this._getSkillset();
    List words = ScopedModel.of<UserModel>(context).wordsToLearn.values.toList();

    //////////////////////////////////////////////////////////////////////////////
    // pobieranie slow do nauki z modelu kursu
    // wstawianie do taskow wyswietlania nowych slowek
    for (int i = 0; i < this._numberOfWords; i++) {
      this._finalTasks.add(NewWordPage(
            word: words[i],
            onNext: this._nextPage,
          ));
    }

    //////////////////////////////////////////////////////////////////////////////
    // dobieranie ilości zadań zależnie od parametrów skilli
    skillset.forEach((skill, value) {
      int x = (value / this._numberOfTasks).round();

      for (int i = 0; i < x; i++) {
        final int rand = Random().nextInt(words.length);
        this._finalTasks.add(this._getLearningTask(skill, words[rand]));
      }
    });

    //////////////////////////////////////////////////////////////////////////////
    // wszystkie taski zebrane do listy
    this._finalTasks.add(LearningFinalPage());
    //////////////////////////////////////////////////////////////////////////////
  }

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
      body: Container(
        child: Column(
          children: <Widget>[
            LearningLabel(point: this._selectedIndex, points: this._finalTasks.length - 1),
            Expanded(
              child: PageView.builder(
                itemCount: this._finalTasks.length,
                controller: pageController,
                onPageChanged: (index) => setState(() => this._selectedIndex = index),
                itemBuilder: (context, index) => this._finalTasks[index],
                // physics: const NeverScrollableScrollPhysics(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
