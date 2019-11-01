import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model {
//
// fields of class
//

///////////////////////////
// main data about user
///////////////////////////

  String _userId = 't0aEzrSxuZcxMtp5GMX2hhzM7ed2';
  String _username = '';
  String _email = '';
  String _language = 'french';

  int _points = 0;
  Timestamp _lastLearningTimestamp = Timestamp(0, 0);
  int _longestStrike;
  int _speedTestStrike;

  int _dailyGoal = 5;
  List<int> _dailyGoalsList = [5, 10, 15, 20];
  List _dailyGoalHistory = [];
  List<bool> _dailyGoalStamps = List.generate(7, (index) => false);

///////////////////////////
// challenges data - needs some changes in DB and here
///////////////////////////

  Map _challenge = {'challenge_id': '', 'title': '', 'description': ''};
  Map _userChallenges = {};

///////////////////////////
// courses data
///////////////////////////

  String _courseIndex = "";
  Map _courses = {};
  Map _chosenCourse = {};
  Map _chosenCourseWords = {};

  Map _wordsToLearn = {}; // map of maps
  List _wordsIgnored = [];
  Map _wordsLearnt = {};
  Map _wordsToRepeat = {};
  Map _wordsToRepeatProcess = {};

  // learning process
  String _iconProcessPath = '';
  int _processPoints = 0;

  // speed test
  Map _wordsSpeedTest = {};
  int _counterSpeedTestStrike = 0;
  int _revives = 3;

  // daily goal
  int _dailyLearntWordsNumber = 0;

// ustalenie do którego kursu należy dany zestaw skilli
// skillset assigned to _editedCourseIndex or _courseIndex
// maybe _editedCOurseIndex can be changed for just _courseIndex
  bool _autoSkillset;
  Map _skillsetUser = {'speaking': 0, 'listening': 0, 'writing': 0, 'reading': 0};
  Map _skillsetDiagnosed = {'speaking': 25, 'listening': 25, 'writing': 25, 'reading': 25};
  String _editedCourseIndex = '';

  // dane do diagnozowania automatycznego
  Map _diagnosedData = {
    "listening": {"counter": 0, "good_answers_counter": 0},
    "speaking": {"counter": 0, "good_answers_counter": 0},
    "reading": {"counter": 0, "good_answers_counter": 0},
    "writing": {"counter": 0, "good_answers_counter": 0}
  };

//
// getters
//

///////////////////////////
// main user data
///////////////////////////

  String get userId => _userId;
  String get username => _username;
  String get email => _email;
  String get language => _language;

  int get points => _points;
  int get longestStrike => _longestStrike;
  Timestamp get lastLearningTimestamp => _lastLearningTimestamp;
  int get speedTestStrike => _speedTestStrike;

  int get dailyGoal => _dailyGoal;
  List get dailyGoalsList => _dailyGoalsList;
  List<dynamic> get dailyGoalHistory => _dailyGoalHistory;
  List<bool> get dailyGoalStamps => _dailyGoalStamps;
///////////////////////////
// challenges data
///////////////////////////

  Map get challenge => _challenge;
  Map get userChallenges => _userChallenges;

///////////////////////////
// courses data
///////////////////////////

  String get courseIndex => _courseIndex;

  Map get courses => _courses;
  Map course({@required String index}) {
    return this._courses[index];
  }

  Map get chosenCourse => this._chosenCourse;
  Map get chosenCourseWords => this._chosenCourseWords;

  Map get wordsLearnt => this._wordsLearnt;
  Map get wordsToRepeat => this._wordsToRepeat;
  Map get wordsToRepeatProcess => this._wordsToRepeatProcess;
  List get wordsIgnored => this._wordsIgnored;
  Map get wordsToLearn => this._wordsToLearn;

  String get iconProcessPath => this._iconProcessPath;
  int get processPoints => this._processPoints;

  // seed test
  Map get wordsSpeedTest => this._wordsSpeedTest;
  int get counterSpeedTestStrike => this._counterSpeedTestStrike;
  int get revives => this._revives;

  // daily goal and longest strike
  int get dailyLearntWordsNumber => this._dailyLearntWordsNumber;

///////////////////////////
// skills data of chosen course
///////////////////////////

  bool get autoSkillset => _autoSkillset;
  Map get skillsetUser => _skillsetUser;
  Map get skillsetDiagnosed => _skillsetDiagnosed;

  int skillUser({String skill}) => _skillsetUser[skill];
  int skillDiagnosed({String skill}) => _skillsetDiagnosed[skill];
  String get editedCourseIndex => _editedCourseIndex;

//
// setters
//

  void setUserId({String uid}) {
    this._userId = uid;
    notifyListeners();
  }

  void setUsername({String username}) {
    this._username = username;
    Firestore.instance.collection("users").document(this._userId).updateData({
      'username': username,
    });
    notifyListeners();
  }

  void setEmail({String email}) async {
    this._email = email;
    await Firestore.instance.collection("users").document(this._userId).updateData({'email': email});
    notifyListeners();
  }

  void setLanguage({String language}) {
    this._language = language;
    notifyListeners();
  }

  void setDailyGoal({int dailyGoal}) async {
    this._dailyGoal = dailyGoal;
    await Firestore.instance.collection("users").document(this._userId).updateData({'daily_goal': dailyGoal});
    notifyListeners();
  }

  void setDailyGoalHistory({List<Timestamp> history}) async {
    this._dailyGoalHistory = history;

    await Firestore.instance
        .collection("users")
        .document(this._userId)
        .updateData({'daily_goal_history': this._dailyGoalHistory});
    notifyListeners();
  }

  void setDailyLearntWordsNumber({int number}) async {
    this._dailyLearntWordsNumber = number;
    await Firestore.instance
        .collection("users")
        .document(this._userId)
        .updateData({'daily_learnt_words_number': number});
    notifyListeners();
  }

  void setPoints({int points}) async {
    this._points = points;
    await Firestore.instance.collection("users").document(this._userId).updateData({"points": points});
    notifyListeners();
  }

  void setSpeedTestStrike({int strike}) async {
    this._speedTestStrike = strike;
    await Firestore.instance
        .collection("users")
        .document(this._userId)
        .updateData({"speed_test_strike": this._speedTestStrike});

    notifyListeners();
  }

  void setLongestStrike({int strike}) async {
    this._longestStrike = strike;
    await Firestore.instance
        .collection("users")
        .document(this._userId)
        .updateData({"longest_strike": this._longestStrike});

    notifyListeners();
  }

  void setLastLearningTimestamp({Timestamp timestamp}) async {
    this._lastLearningTimestamp = timestamp;
    await Firestore.instance
        .collection("users")
        .document(this._userId)
        .updateData({"last_learning_timestamp": this._lastLearningTimestamp});

    notifyListeners();
  }
///////////////////////////
// challenges data
///////////////////////////

  void setChallenge({Map challenge, bool isFinished = false}) async {
    if (isFinished) {
      this._challenge = {
        "challenge_id": "0",
        "title": "",
        "description": "",
      };

      await Firestore.instance.collection("users").document(this._userId).updateData({"challenge_id": "0"});
    } else {
      this._challenge = challenge;
    }

    notifyListeners();
  }

///////////////////////////
// set courses
///////////////////////////

  // the setter of courseIndex
  // you can use as a field of a class: courseIndex = ''
  // it can be set when user taps on a CourseBox and he can choose any learning proposition
  // ustawiany gdy click na CourseBox
  set courseIndex(String index) {
    this._courseIndex = index;
    notifyListeners();
  }

  // the setter should work when a course is clicked and user chose any process to learn
  // key of course - _courseIndex, set on tap on the CourseBox OR it can be given with parameter
  // sets two: Map and List of info about the course from CoursesDB and UserDB
  void setChosenCourse({String index = ''}) async {
    if (index.isEmpty) index = this._courseIndex;
    DocumentSnapshot dsCourse = await Firestore.instance.collection('courses').document(index).get();

    if (dsCourse.exists) {
      this._chosenCourse['language'] = dsCourse.data['language'];
      this._chosenCourse['title'] = dsCourse.data['title'];
      this._chosenCourse['type'] = dsCourse.data['type'];

      // type of MAP
      this._chosenCourse['words_number'] = dsCourse.data['collection_of_words'].keys.length;
      this._chosenCourseWords = dsCourse.data['collection_of_words'];
    } else {
      this._chosenCourse['language'] = '';
      this._chosenCourse['title'] = '';
      this._chosenCourse['type'] = '';
      this._chosenCourse['words_number'] = 0;
      this._chosenCourseWords = {};
    }

    notifyListeners();
  }

  // the setter of new course added by the user with click on Add a New Course to Learn
  // update in UserModel _courses and UserDB
  void setNewCourse() async {
    this._courses[this._courseIndex] = {
      'words_to_learn': {},
      'words_learnt': {},
      'words_to_repeat': {},
      'words_ignored': [],
      'skills_auto': {
        "listening": 25,
        "speaking": 25,
        "reading": 25,
        "writing": 25,
      },
      'skills_user': {
        "listening": 25,
        "speaking": 25,
        "reading": 25,
        "writing": 25,
      },
      "diagnosed_data": {
        "listening": {"counter": 0, "good_answers_counter": 0},
        "speaking": {"counter": 0, "good_answers_counter": 0},
        "reading": {"counter": 0, "good_answers_counter": 0},
        "writing": {"counter": 0, "good_answers_counter": 0}
      },
      'auto_on': true,
    };

    Firestore.instance.collection("users").document(userId).updateData({"courses": this._courses});
    notifyListeners();
  }

  // the deletion of the course after clicking "Resign from the course" in LearningPageChoiceModal
  // the course whose key is kept in - _courseIndex
  // is deleted from UserDB and in UserModel field - _courses assigned to user
  void deleteCourse() async {
    if (this._courses.containsKey(this._courseIndex)) {
      this._courses.remove(this._courseIndex);

      this._courseIndex = '';
      this._chosenCourse = {};
      this._chosenCourseWords = {};

      this._wordsToLearn = {};
      this._wordsIgnored = [];
      this._wordsLearnt = {};
      this._wordsToRepeat = {};
      this._wordsToRepeatProcess = {};

      this._skillsetUser = {'speaking': 0, 'listening': 0, 'writing': 0, 'reading': 0};
      this._skillsetDiagnosed = {'speaking': 25, 'listening': 25, 'writing': 25, 'reading': 25};
      this._diagnosedData = {
        "listening": {"counter": 0, "good_answers_counter": 0},
        "speaking": {"counter": 0, "good_answers_counter": 0},
        "reading": {"counter": 0, "good_answers_counter": 0},
        "writing": {"counter": 0, "good_answers_counter": 0}
      };
      this._editedCourseIndex = '';
      notifyListeners();

      await Firestore.instance.collection("users").document(userId).updateData({"courses": this._courses});
    }
  }

///////////////////////////
// set learning process
///////////////////////////

// points and learning details

  set iconProcessPath(String iconPath) {
    this._iconProcessPath = iconPath;
    notifyListeners();
  }

  set processPoints(int points) {
    this._processPoints = points;
    notifyListeners();
  }

  void addToProcessPoints(int points) {
    this._processPoints += points;
    notifyListeners();
  }

  void pushPointsToDb(int points) async {
    if (points > 0) {
      this._points += points;
      await Firestore.instance.collection("users").document(userId).updateData({"points": this._points});
      this._processPoints = 0;
      this._counterSpeedTestStrike = 0;

      notifyListeners();
    }
  }

  // HELP TEXTS

  String getHelpText({@required String wordkey}) {
    return this._courses[this._courseIndex]['words_to_learn'][wordkey]['help_text'];
  }

  void setHelpText({@required String wordkey, @required String helpText}) async {
    this._wordsToLearn[wordkey]["help_text"] = helpText;
    this._courses[this._courseIndex]['words_to_learn'] = this._wordsToLearn;
    await Firestore.instance.collection("users").document(userId).updateData({"courses": this._courses});

    notifyListeners();
  }

  List getHelpTextList({@required String wordkey}) {
    return this._chosenCourseWords[wordkey]['help_texts'];
  }

  void addHelpText({@required String wordkey, @required String text}) async {
    this._chosenCourseWords[wordkey]['help_texts'] = [...this._chosenCourseWords[wordkey]['help_texts'], text];
    this._courses[this._courseIndex]['words_to_learn'][wordkey]
        ['help_texts'] = [...this._chosenCourseWords[wordkey]['help_texts']];

    notifyListeners();

    await Firestore.instance.collection("users").document(userId).updateData({"courses": this._courses});
    await Firestore.instance
        .collection("courses")
        .document(this._courseIndex)
        .updateData({"collection_of_words": this._chosenCourseWords});
  }

  // words to learn setup

  void setCourseWords({@required String index}) async {
    this._wordsToLearn = {};
    this._wordsIgnored = [];
    this._wordsLearnt = {};
    this._wordsToRepeat = {};
    this._wordsToRepeatProcess = {};

    DocumentSnapshot ds = await Firestore.instance.collection("users").document(userId).get();

    if (ds.exists) {
      this._wordsLearnt = ds.data['courses'][index]['words_learnt'];
      this._wordsIgnored = [...ds.data['courses'][index]['words_ignored']];
      this._wordsToLearn = ds.data['courses'][index]['words_to_learn'];
      this._wordsToRepeat = ds.data['courses'][index]['words_to_repeat'];

      // spr czy slowka w wordsToLearn sa juz nauczone
      // czy zrobić to w coursebox

      this._wordsLearnt.forEach((wordkey, worddata) {
        if (this._wordsToLearn.containsKey(wordkey)) {
          this._wordsToLearn.remove(wordkey);
        }
        if (DateTime.now().isAfter(worddata['timestamp'].toDate())) {
          this._wordsToRepeat[wordkey] = worddata;
        }
      });

      this._courses[index]['words_to_repeat'] = this._wordsToRepeat;
      this._courses[index]['words_to_learn'] = this._wordsToLearn;

      await Firestore.instance.collection("users").document(userId).updateData({"courses": this._courses});
    }

    notifyListeners();
  }

  void ignoreWordToLearn(String key) async {
    this._wordsToLearn.remove(key);
    this._wordsIgnored.add(key);
    notifyListeners();

    this._courses[this._courseIndex]['words_ignored'] = this._wordsIgnored;
    this._courses[this._courseIndex]['words_to_learn'] = this._wordsToLearn;
    print(this._wordsToLearn);

    await Firestore.instance.collection("users").document(userId).updateData({"courses": this._courses});
  }

////////////////////////////////////////////////////////////////////////////

  void setWordsToRepeat({int amount = 4}) {
    Map chosenWords = {};
    int size = (this._wordsToRepeat.length >= amount ? amount : this._wordsToRepeat.length);
    List keys = this._wordsToRepeat.keys.toList();
    keys.shuffle();

    for (int i = 0; i < size; i++) {
      chosenWords[keys[i]] = this._chosenCourseWords[keys[i]];
      chosenWords[keys[i]]['good_answers_number'] = 0;
      chosenWords[keys[i]]['views'] = 0;

      Map values = this._wordsToRepeat[keys[i]];
      values.forEach((key, value) {
        chosenWords[keys[i]][key] = value;
      });
    }

    this._wordsToRepeatProcess = chosenWords;
  }

  void setWordsToLearn({int amount = 4}) async {
    this._wordsToLearn = this._courses[this._courseIndex]['words_to_learn'];
    var wordsToAdd = amount - this._wordsToLearn.length;

    if (wordsToAdd == 0) {
      return;
    }

    List keys = this._chosenCourseWords.keys.toList();

    // wyszukiwanie pozostalych niepoznanych jeszcze slow
    List remainingWordsToLearnKeys = keys.where((key) {
      return !this._wordsIgnored.contains(key) &&
          !this._wordsToRepeat.containsKey(key) &&
          !this._wordsToLearn.containsKey(key) &&
          !this._wordsLearnt.containsKey(key);
    }).toList();

    remainingWordsToLearnKeys.shuffle();

    // wypelnianie listy jesli jeszcze sa jakies slowka do nauczenia
    if (remainingWordsToLearnKeys.length > 0) {
      for (int i = 0; i < remainingWordsToLearnKeys.length; i++) {
        final key = remainingWordsToLearnKeys[i];
        this._wordsToLearn[key] = this._chosenCourseWords[key];
        this._wordsToLearn[key]['good_answers_number'] = 0;
        this._wordsToLearn[key]['help_text'] = "";

        wordsToAdd--;
        if (wordsToAdd == 0) {
          break;
        }
      }
    }

    // update do bazy danych
    this._courses[this._courseIndex]['words_to_learn'] = this._wordsToLearn;
    notifyListeners();
    await Firestore.instance.collection("users").document(userId).updateData({"courses": this._courses});
  }

////////////////////////////////////////////////////////////////////////////

  void addGoodAnswerSessionProcess({@required String wordKey}) async {
    this._wordsToLearn[wordKey]['good_answers_number'] += 1;

    print("Add good answers " + wordKey.toString());
    if (this._wordsToLearn[wordKey]['good_answers_number'] >= 10) {
      int level = 0;
      // data nast powtórzenia
      print(wordKey.toString() + " moved to wordsLearnt");
      this._wordsLearnt[wordKey] = {};
      this._wordsLearnt[wordKey]['timestamp'] = Timestamp.fromDate(DateTime.now().add(Duration(days: pow(2, level))));
      this._wordsLearnt[wordKey]['level'] = level;
      this._wordsLearnt[wordKey]['help_text'] = this.wordsToLearn[wordKey]['help_text'];
    }

    this._courses[this._courseIndex]['words_learnt'] = this._wordsLearnt;
    this._courses[this._courseIndex]['words_to_learn'] = this._wordsToLearn;

    notifyListeners();
    await Firestore.instance.collection("users").document(userId).updateData({"courses": this._courses});
  }

  void addAnswerRepetitionProcess({@required bool successed, @required String wordKey}) {
    // _wordsToRepeatProcess
    this._wordsToRepeatProcess[wordKey]['views'] += 1;

    if (successed) {
      this._wordsToRepeatProcess[wordKey]['good_answers_number'] += 1;
    } else {
      this._wordsToRepeatProcess[wordKey]['good_answers_number'] -= 1;
    }
    notifyListeners();
  }

  ////////////////////////////////////////////////////////////////////////////

  // daily goal and the longest strike
  void addRepeatedWords() async {
    DateTime lastLearningDateTime = this._lastLearningTimestamp.toDate();
    DateTime finishedRepetitionDateTime = DateTime.now();
    Map practisedWords = {};
    int level = 0;

    if (lastLearningDateTime.day != finishedRepetitionDateTime.day) {
      this._dailyLearntWordsNumber = 0;
    }

    // print("Add repeated words to database");
    // print(this._wordsToRepeatProcess.keys);

    this._wordsToRepeatProcess.forEach((key, data) {
      // jesli wgl slowo bylo widziane w procesie powtorki
      if (data['views'] >= 2) {
        // jesli odp prawie bezbledne, to level+1
        if (data['good_answers_number'] / data['views'] >= 0.75) {
          //print("Very good " + key + " " + (data['good_answers_number'] / data['views']).toString());
          level = data['level'] + 1;
          practisedWords[key] = {
            'timestamp': Timestamp.fromDate(finishedRepetitionDateTime.add(Duration(days: pow(2, level)))),
            'level': level,
          };
        }
        // jesli odp z wieksza iloscia bledow to level == level
        else if (data['good_answers_number'] / data['views'] >= 0.5) {
          //print("Only good " + key + " " + (data['good_answers_number'] / data['views']).toString());
          level = data['level'];
          practisedWords[key] = {
            'timestamp': Timestamp.fromDate(finishedRepetitionDateTime.add(Duration(days: pow(2, level)))),
            'level': level,
          };
        }
        // else nauka od poczatku = level: 0
        else {
          //print("Weak " + key + " " + (data['good_answers_number'] / data['views']).toString());
          level = 0;
          practisedWords[key] = {
            'timestamp': Timestamp.fromDate(finishedRepetitionDateTime.add(Duration(days: pow(2, level)))),
            'level': level,
          };
        }
      }
    });

    print(practisedWords);

    // oczyscic this._wordsToRepeatProcess
    this._wordsToRepeatProcess = {};

    // usunac odpowiednie slowa z bazy this._wordsToRepeat
    // i przeniesc do this._wordsLearnt

    practisedWords.forEach((wordkey, value) {
      this._wordsLearnt[wordkey] = value;
      this._wordsToRepeat.remove(wordkey);
    });

    this._courses[this._courseIndex]['words_learnt'] = this._wordsLearnt;
    this._courses[this._courseIndex]['words_to_repeat'] = this._wordsToRepeat;

    setDailyLearntWordsNumber(number: this._dailyLearntWordsNumber + this._wordsToRepeatProcess.length);
    setLastLearningTimestamp(timestamp: Timestamp.fromDate(finishedRepetitionDateTime));
    notifyListeners();

    await Firestore.instance.collection("users").document(userId).updateData({"courses": this._courses});
  }

  void addPractisedWords() {
    Timestamp learntWordsTimestamp = Timestamp.now();

    DateTime lastLearningDateTime = this._lastLearningTimestamp.toDate();
    DateTime learntWordsDateTime = learntWordsTimestamp.toDate();
    // print("add practised words");
    // print(lastLearningTimestamp.toDate());
    // print(learntWordsDateTime);

    if (lastLearningDateTime.day != learntWordsDateTime.day) {
      this._dailyLearntWordsNumber = 0;
    }

    setDailyLearntWordsNumber(number: this._dailyLearntWordsNumber + this._wordsToLearn.length);
    // print("Add practised words " + this._dailyLearntWordsNumber.toString());
    setLastLearningTimestamp(timestamp: learntWordsTimestamp);
    // print(this._dailyLearntWordsNumber);
    // print("-------");
    notifyListeners();
  }

  void checkLearningRecordAchieved() {
    // print("Check record learning");
    // print(this._longestStrike);
    if (this._dailyLearntWordsNumber > this._longestStrike) {
      // print(this._dailyLearntWordsNumber);
      setLongestStrike(strike: this._dailyLearntWordsNumber);
      notifyListeners();
    }
    // print(this._longestStrike);
    // print("-------");
  }

  void setDailyGoalStamps() {
    DateTime today = DateTime.now();
    List<Timestamp> newDailyGoalHistory = [];
    int maxSize = 6; // 0 - 6 indexing

    this._dailyGoalHistory.forEach((timestamp) {
      int differenceInDays = today.difference(timestamp.toDate()).inDays;
      if (differenceInDays <= maxSize) {
        this._dailyGoalStamps[maxSize - differenceInDays] = true;
        newDailyGoalHistory.add(timestamp);
      }
    });

    // sort descending
    newDailyGoalHistory.sort();
    this.setDailyGoalHistory(history: newDailyGoalHistory);
  }

  bool checkDailyGoalAchieved() {
    bool dailyGoalAchieved =
        DateTime.now().difference(this._dailyGoalHistory[this._dailyGoalHistory.length - 1].toDate()).inDays == 0;

    final bool achievedNow = this._dailyLearntWordsNumber >= this._dailyGoal && !dailyGoalAchieved;
    if (achievedNow) {
      Timestamp goal = Timestamp.now();
      this.dailyGoalHistory.add(goal);
      this.setDailyGoalStamps();
    }
    return achievedNow;
  }

// speed test

  void setSpeedTestRevives({int revives = 3}) {
    this._revives = revives;
    notifyListeners();
  }

  set counterSpeedTestStrike(int strike) {
    this._counterSpeedTestStrike = strike;
    notifyListeners();
  }

  bool checkSpeedTestStrike() {
    if (this._counterSpeedTestStrike > this._speedTestStrike) {
      this.setSpeedTestStrike(strike: this._counterSpeedTestStrike);
      notifyListeners();
      return true;
    }
    return false;
  }

  void setWordsForSpeedTest() {
    if (this._wordsLearnt.length > 0) {
      this.wordsLearnt.forEach((wordKey, date) {
        this._wordsSpeedTest[wordKey] = this._chosenCourseWords[wordKey];
      });
    }
    if (this._wordsToRepeat.length > 0) {
      this._wordsToRepeat.forEach((wordKey, date) {
        this._wordsSpeedTest[wordKey] = this._chosenCourseWords[wordKey];
      });
    }
    if (this._wordsToLearn.length > 0) {
      this._wordsToLearn.forEach((wordKey, word) {
        this._wordsSpeedTest[wordKey] = this._chosenCourseWords[wordKey];
      });
    }

    notifyListeners();
  }

///////////////////////////
// set skillset
///////////////////////////

  void setAutoMethod({bool isAuto, String index}) async {
    this._courses[index]['auto_on'] = isAuto;
    await Firestore.instance.collection('users').document(this._userId).updateData({'courses': this._courses});
    this._autoSkillset = isAuto;
    notifyListeners();
  }

  void setEditedCourseSkillsetIndex({@required String index}) {
    this._editedCourseIndex = index;
    notifyListeners();
  }

  // the setter of skill in EditMode page
  // the elem is changed onSaved in SmallInput component
  // only here conection to DB
  void setSkillUser({String key, int value}) async {
    this._skillsetUser[key] = value;
    this._courses[this._editedCourseIndex]['skills_user'][key] = value;
    await Firestore.instance.collection('users').document(this._userId).updateData({'courses': this._courses});
    notifyListeners();
  }

  void setSkillsetUser({Map skillset}) {
    this._skillsetUser = skillset;
    notifyListeners();
  }

  void setDiagnosedSkillset({Map skillset}) {
    this._skillsetDiagnosed = skillset;
    notifyListeners();
  }

  void setSkillset({@required String index}) {
    this._autoSkillset = this._courses[index]['auto_on'];
    this._skillsetDiagnosed = this._courses[index]['skills_auto'];
    this._skillsetUser = this._courses[index]['skills_user'];

    notifyListeners();
  }

  // mechanizm diagnozowania
  Map get diagnosedData => this._diagnosedData;
  Map getDiagnosedSkillData({@required String skill}) => this._diagnosedData[skill];

/*  
  Map _diagnosedData = {
    "listening": {
      "counter": 0,
      "good_answers_counter": 0,
    },
    "speaking": {
      "counter": 0,
      "good_answers_counter": 0,
    },
    "reading": {
      "counter": 0,
      "good_answers_counter": 0,
    },
    "writing": {
      "counter": 0,
      "good_answers_counter": 0,
    }
  };
  */
  void setDiagnosedData({@required String courseIndex}) {
    if (courseIndex.isEmpty) courseIndex = this._courseIndex;

    this._diagnosedData = this._courses[courseIndex]['diagnosed_data'];
    notifyListeners();
  }

  void addToDiagnosingSkill({@required String skillkey, @required bool isCorrectAnswer}) {
    if (this._diagnosedData.containsKey(skillkey)) {
      this._diagnosedData[skillkey]['counter'] += 1;
      if (isCorrectAnswer) this._diagnosedData[skillkey]['good_answers_counter'] += 1;
      notifyListeners();
    }
  }

  void diagnoseSkillset() async {
    print(this._diagnosedData);
    this._courses[courseIndex]['diagnosed_data'] = this._diagnosedData;

    Map newDiagnosedSkills = {};
    double sumWages = 0;
    Map minKey = {'key': "", "value": 100};
    Map maxKey = {'key': "", "value": 0};

    this._skillsetDiagnosed.forEach((skill, wage) {
      newDiagnosedSkills[skill] = 0;

      double errorsScore =
          1.0 - this._diagnosedData[skill]["good_answers_counter"] / this._diagnosedData[skill]["counter"];

      double newWage = errorsScore * wage;
      newWage.round();

      if (newWage > 70) {
        newWage = 70;
      } else if (newWage < 10) {
        newWage = 10;
      }

      if (minKey["value"] > newWage) {
        minKey["value"] = newWage;
        minKey["key"] = skill;
      } else if (maxKey["value"] < newWage) {
        maxKey["value"] = newWage;
        maxKey["key"] = skill;
      }

      newDiagnosedSkills[skill] = newWage;
      sumWages += newWage;
    });

    if (sumWages != 100) {
      double difference = (100.0 - sumWages).abs();
      int diff = (difference / newDiagnosedSkills.length).floor();

      newDiagnosedSkills.forEach((skill, newWage) {
        if (sumWages < 100) {
          newDiagnosedSkills[skill] = newWage + diff;
          sumWages += diff;
        } else if (sumWages > 100) {
          newDiagnosedSkills[skill] = newWage - diff;
          sumWages -= diff;
        }
      });

      if (sumWages < 100) {
        newDiagnosedSkills[minKey["key"]] += 100 - sumWages;
      } else if (sumWages > 100) {
        newDiagnosedSkills[maxKey["key"]] -= sumWages - 100;
      }
    }

    print(newDiagnosedSkills);
//    await Firestore.instance.collection('users').document(this._userId).updateData({'courses': this._courses});

    // update skillset diagnosed
    notifyListeners();
  }

///////////////////////////
// setters of user data
///////////////////////////

  // the setter of User during the Login process
  // userID is set before the setUserData or it can be given as a parameter of the setter
  // all the data are downloaded from UserDB and they are set in fields of UserModel class
  void setUserData({String uid = ''}) async {
    if (uid.length > 0) this._userId = uid;
    DocumentSnapshot ds = await Firestore.instance.collection("users").document(this._userId).get();

    if (ds.exists) {
      Map data = ds.data;

      this._email = data['email'];
      this._username = data['username'];
      this._longestStrike = data['longest_strike'];
      this._speedTestStrike = data['speed_test_strike'];
      this._lastLearningTimestamp = data['last_learning_timestamp'];
      this._points = data['points'];

      this._dailyGoal = data['daily_goal'];
      this._dailyGoalHistory = data['daily_goal_history'];
      this._dailyLearntWordsNumber = data['daily_learnt_words_number'];

      this._userChallenges = data['challenges'];
      this._courses = data['courses'];
      this._challenge = {'challenge_id': data["challenge_id"]};
    }

    this.setDailyGoalStamps();

    // print("Set user data " + this._dailyLearntWordsNumber.toString());
    notifyListeners();
  }

  // the setter of data of new user created on registration
  // data achieved from fields of register view
  // data set in fields of UserModel and in UserDB

  void setNewUserData({@required String uid, @required String username, @required String email}) async {
    this._userId = uid;
    this._email = email;
    this._username = username;

    this._points = 0;
    this._longestStrike = 0;
    this._speedTestStrike = 0;
    // TODO: im not sure
    this._lastLearningTimestamp = Timestamp.now();
    this._dailyLearntWordsNumber = 0;

    this._dailyGoal = 10;
    this._dailyGoalHistory = [];
    this._dailyGoalStamps = List.generate(7, (index) => false);

    this._challenge = {};
    this._courses = {};

    await Firestore.instance.collection("users").document(uid).setData({
      'username': username,
      'email': email,
      'longest_strike': 0,
      'speed_test_strike': 0,
      // TODO: im not sure
      'last_learning_timestamp': this._lastLearningTimestamp,
      'daily_learnt_words_number': this._dailyLearntWordsNumber,
      'points': 0,
      'courses': {},
      'daily_goal': this._dailyGoal,
      'daily_goal_history': this._dailyGoalHistory,
      'challenges': {},
      'challenge_id': 0,
    });

    notifyListeners();
  }

  // the deletion of user data from fields of UserModel
  // works on LOG OUT button in SettingsPage

  void deleteUserData() {
    this._userId = '';
    this._username = '';
    this._email = '';
    this._language = '';

    this._points = 0;
    this._longestStrike = 0;
    this._speedTestStrike = 0;
    this._lastLearningTimestamp = null;

    this._dailyGoal = 10;
    this._dailyGoalHistory = [];
    this._dailyGoalStamps = List.generate(7, (index) => false);

    this._challenge = {};
    this._userChallenges = {};

    this._courses = {};
    this._courseIndex = '';
    this._chosenCourse = {};
    this._chosenCourseWords = {};

    this._processPoints = 0;
    this._revives = 3;
    this._counterSpeedTestStrike = 0;
    this._dailyLearntWordsNumber = 0;
    this._editedCourseIndex = "";
    this._iconProcessPath = "";

    this._autoSkillset = false;
    this._skillsetUser = {'speaking': 0, 'listening': 0, 'writing': 0, 'reading': 0};
    this._skillsetDiagnosed = {'speaking': 25, 'listening': 25, 'writing': 25, 'reading': 25};
    this._diagnosedData = {
      "listening": {"counter": 0, "good_answers_counter": 0},
      "speaking": {"counter": 0, "good_answers_counter": 0},
      "reading": {"counter": 0, "good_answers_counter": 0},
      "writing": {"counter": 0, "good_answers_counter": 0}
    };

    this._editedCourseIndex = '';

    notifyListeners();
  }

  static UserModel of(BuildContext context) => ScopedModel.of<UserModel>(context);
}
