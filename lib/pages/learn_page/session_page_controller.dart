import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:langapp/components/appbar_upper/appbar_upper.dart';
import 'package:langapp/components/learning_process/learning_label.dart';
import 'package:langapp/components/modals/learning_choice_modal.dart';
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

class SessionPageController extends StatefulWidget {
  @override
  _SessionPageControllerState createState() => _SessionPageControllerState();
}

class _SessionPageControllerState extends State<SessionPageController> {
  // EXAMPLE SETUP
  // number of words to learn for this session
  final int _numberOfWords = 4;
  // number of tasks to do for this session
  final int _numberOfTasks = 10;
  final int _pointsForTask = 15;

  int _strike = 0;

  // list to collect initialized objects of pages
  Map<String, List<Widget>> _finalTasks = {};

  // list of pages
  List _pages = [];

  // page controller needed for BUILD function to create a VIEW
  PageController pageController = PageController();

  // index for BUILD
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // prepared words to learn
    ScopedModel.of<UserModel>(context).iconProcessPath = "assets/course/add.svg";
    ScopedModel.of<UserModel>(context).processPoints = 0;
    ScopedModel.of<UserModel>(context).setWordsToLearn(amount: this._numberOfWords);
    print(ScopedModel.of<UserModel>(context).dailyLearntWordsNumber);

    // wybrany kurs (usermodel - chosenCourse)
    // na start lista wszystkich słów dla danego kursu (typ Map w UserModel - chosenCourseWords)
    // lista słow już widzianych (learntWords - typ Map)
    // lista słow do powtórzenia (wordsToRepeat - typ Map)
    // lista słow zignorowanych (wordsIgnored)
    // pobieranie słow do nauki (wordsToLearn)
    // skillset (skillsetUser , skillsetDiagnosed, czy jest auto : skillsetDiagnosed )

    // generated list of tasks for one session
    this._generateTasks();
    this._setPages();
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

  Widget _getLearningTask(String type, String wordKey, Map word) {
    switch (type) {
      case 'speaking':
        return TextTaskSpeakWord(
          wordKey: wordKey,
          word: word,
          onNext: this._nextPage,
        );
      case 'listening':
        {
          final int rand = Random().nextInt(2);
          Widget result;
          if (rand == 0)
            result = TextTaskChooseSound(
              wordKey: wordKey,
              word: word,
              onNext: this._nextPage,
            );
          else
            result = SoundTaskChooseWord(
              wordKey: wordKey,
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
              wordKey: wordKey,
              word: word,
              onNext: this._nextPage,
            );
          else
            result = TextTaskChooseWord(
              wordKey: wordKey,
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
              wordKey: wordKey,
              word: word,
              onNext: this._nextPage,
            );
          else
            result = TextTaskWriteWord(
              wordKey: wordKey,
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
      ScopedModel.of<UserModel>(context).addToProcessPoints(this._pointsForTask);
    } else {
      // nie wiem co, nie daj punktu
      // wyswietlac strone NewWordPage
    }
    pageController.nextPage(duration: const Duration(milliseconds: 250), curve: Curves.easeIn);
  }

  void _generateTasks() {
    //////////////////////////////////////////////////////////////////////////////

    Map skillset = this._getSkillset();
    Map wordsToLearn = ScopedModel.of<UserModel>(context).wordsToLearn;

    // gdy nie ma już słów do nauki
    if (wordsToLearn.length == 0) {
      this._finalTasks['final'] = [LearningFinalPage(noWordsToLearn: true, type: "session")];
      return;
    }

    //////////////////////////////////////////////////////////////////////////////
    // pobieranie slow do nauki z modelu kursu
    // wstawianie do taskow wyswietlania nowych slowek

    wordsToLearn.forEach((key, word) {
      this._finalTasks[key] = [
        NewWordPage(
          wordKey: key,
          word: word,
          onNext: this._nextPage,
        )
      ];
    });

    //////////////////////////////////////////////////////////////////////////////
    // dobieranie ilości zadań zależnie od parametrów skilli

    List keys = wordsToLearn.keys.toList();

    skillset.forEach((skill, value) {
      int x = (value / this._numberOfTasks).round();

      for (int i = 0; i < x; i++) {
        final int rand = Random().nextInt(keys.length);
        final key = keys[rand];

        if (this._finalTasks.containsKey(key)) {
          this._finalTasks[key].add(this._getLearningTask(
                skill,
                key,
                wordsToLearn[key],
              ));
        } else {
          this._finalTasks[key] = [
            this._getLearningTask(
              skill,
              key,
              wordsToLearn[key],
            )
          ];
        }
      }
    });

    // for (int i = 0; i < 10; i++) {
    //   final int rand = Random().nextInt(keys.length);
    //   final key = keys[rand];

    //   if (this._finalTasks.containsKey(key)) {
    //     this._finalTasks[key].add(
    //           TextTaskSpeakWord(
    //             wordKey: key,
    //             word: wordsToLearn[key],
    //             onNext: this._nextPage,
    //           ),
    //         );
    //   } else {
    //     this._finalTasks[key] = [
    //       TextTaskSpeakWord(
    //         wordKey: key,
    //         word: wordsToLearn[key],
    //         onNext: this._nextPage,
    //       )
    //     ];
    //   }
    // }

    this._finalTasks['final'] = [LearningFinalPage(type: "session")];
  }

  void _setPages() {
    Map wordsToLearn = ScopedModel.of<UserModel>(context).wordsToLearn;

    this._finalTasks.forEach((key, value) {
      if (wordsToLearn.containsKey(key)) {
        this._pages.addAll(value);
      }
    });
    this._pages.add(this._finalTasks['final'][0]);
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
      body: Container(
        child: Column(
          children: <Widget>[
            LearningLabel(point: this._selectedIndex, points: this._pages.length - 1),
            Expanded(
              child: PageView.builder(
                itemCount: this._pages.length,
                controller: pageController,
                onPageChanged: (index) => setState(() => this._selectedIndex = index),
                itemBuilder: (context, index) => this._pages[index],
                // physics: const NeverScrollableScrollPhysics(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
