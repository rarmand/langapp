import 'dart:math';

import 'package:flutter/material.dart';
import 'package:langapp/components/appbar_upper/appbar_upper.dart';
import 'package:langapp/components/learning_process/learning_label.dart';
import 'package:langapp/components/modals/learning_choice_modal.dart';
import 'package:langapp/components/modals/stop_session_modal.dart';
import 'package:langapp/model/app_model.dart';
import 'package:langapp/pages/learn_page/learning_final_page.dart';
import 'package:langapp/pages/learn_page/sound_task_choose_word.dart';
import 'package:langapp/pages/learn_page/sound_task_write_word.dart';
import 'package:langapp/pages/learn_page/text_task_assemble_word.dart';
import 'package:langapp/pages/learn_page/text_task_choose_sound.dart';
import 'package:langapp/pages/learn_page/text_task_choose_word.dart';
import 'package:langapp/pages/learn_page/text_task_speak_word.dart';
import 'package:langapp/pages/learn_page/text_task_write_word.dart';
import 'package:langapp/styles/colors.dart';
import 'package:scoped_model/scoped_model.dart';

class RepetitionPageController extends StatefulWidget {
  @override
  _RepetitionPageControllerState createState() => _RepetitionPageControllerState();
}

class _RepetitionPageControllerState extends State<RepetitionPageController> {
  final int _numberOfWords = 4;
  final int _numberOfTasks = 10;
  final int _pointsForTask = 15;

  // list to collect initialized objects of pages
  Map<String, List<Widget>> _finalTasks = {};

  // page controller needed for BUILD function to create a VIEW
  PageController pageController = PageController();
  // index for BUILD
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // prepared words to learn
    ScopedModel.of<UserModel>(context).iconProcessPath = "assets/course/review_vocab.svg";
    ScopedModel.of<UserModel>(context).processPoints = 0;
    ScopedModel.of<UserModel>(context).setWordsToRepeat(amount: this._numberOfWords);
    print("Repetition init state " + ScopedModel.of<UserModel>(context).dailyLearntWordsNumber.toString());

    this._generateTasks();
  }

  Map _getSkillset() {
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
          skill: 'speaking',
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
              skill: 'listening',
              onNext: this._nextPage,
            );
          else
            result = SoundTaskChooseWord(
              wordKey: wordKey,
              word: word,
              skill: 'listening',
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
              skill: 'reading',
              onNext: this._nextPage,
            );
          else
            result = TextTaskChooseWord(
              wordKey: wordKey,
              word: word,
              skill: 'reading',
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
              skill: 'writing',
              onNext: this._nextPage,
            );
          else
            result = TextTaskWriteWord(
              wordKey: wordKey,
              word: word,
              skill: 'writing',
              onNext: this._nextPage,
            );
          return result;
        }
      default:
        return null;
    }
  }

  void _nextPage(bool successed, String wordkey, String skill) async {
    ScopedModel.of<UserModel>(context).addAnswerRepetitionProcess(successed: successed, wordKey: wordkey);
    if (skill.isNotEmpty) {
      ScopedModel.of<UserModel>(context).addToDiagnosingSkill(skillkey: skill, isCorrectAnswer: successed);
    }

    if (successed) {
      ScopedModel.of<UserModel>(context).addToProcessPoints(this._pointsForTask);
    }

    pageController.nextPage(duration: const Duration(milliseconds: 250), curve: Curves.easeIn);
  }

  void _generateTasks() {
    //////////////////////////////////////////////////////////////////////////////

    Map skillset = this._getSkillset();
    // words to repeat dla danego kursu
    Map words = ScopedModel.of<UserModel>(context).wordsToRepeatProcess;

    // gdy nie ma już słów do nauki
    if (words.length == 0) {
      this._finalTasks['final'] = [LearningFinalPage(noWordsToLearn: true, type: "repetition")];
      return;
    }

    //////////////////////////////////////////////////////////////////////////////
    // dobieranie ilości zadań zależnie od parametrów skilli

    List keys = words.keys.toList();

    skillset.forEach((skill, value) {
      int x = (value / this._numberOfTasks).round();

      for (int i = 0; i < x; i++) {
        final int rand = Random().nextInt(keys.length);
        final key = keys[rand];

        if (this._finalTasks.containsKey(key)) {
          this._finalTasks[key].add(this._getLearningTask(
                skill,
                key,
                words[key],
              ));
        } else {
          this._finalTasks[key] = [
            this._getLearningTask(
              skill,
              key,
              words[key],
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
    //             word: words[key],
    //             onNext: this._nextPage,
    //           ),
    //         );
    //   } else {
    //     this._finalTasks[key] = [
    //       TextTaskSpeakWord(
    //         wordKey: key,
    //         word: words[key],
    //         onNext: this._nextPage,
    //       )
    //     ];
    //   }
    // }

    this._finalTasks['final'] = [LearningFinalPage(type: "repetition")];
  }

  List _setPages() {
    Map words = ScopedModel.of<UserModel>(context).wordsToRepeat;
    final List pages = [];
    this._finalTasks.forEach((key, value) {
      if (words.containsKey(key)) {
        pages.addAll(value);
      }
    });
    pages.add(this._finalTasks['final'][0]);

    return pages;
  }

  // app bar actions
  void _onClosePressed() {
    showDialog(
      context: context,
      builder: (context) => StopSessionModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    String courseTitle = ScopedModel.of<UserModel>(context, rebuildOnChange: true).chosenCourse['title'];
    if (courseTitle == null) courseTitle = "Course Title";

    final List pages = this._setPages();

    return Scaffold(
      appBar: AppBarUpper(
        title: courseTitle,
        isCourseAppBar: true,
        onLogoTap: this._onClosePressed,
        onClosePressed: this._onClosePressed,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            LearningLabel(point: this._selectedIndex, points: pages.length - 1),
            Expanded(
              child: PageView.builder(
                itemCount: pages.length,
                controller: pageController,
                onPageChanged: (index) => setState(() => this._selectedIndex = index),
                itemBuilder: (context, index) => pages[index],
                physics: const NeverScrollableScrollPhysics(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
