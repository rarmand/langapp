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

  int _points = 555;
  int _longestStrike;
  int _speedTestStrike;

  int _dailyGoal = 10;
  List _dailyGoalHistory = [];

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
  Map _wordsToLearn = {};
  List _wordsIgnored = [];
  Map _wordsLearnt = {};
  Map _wordsToRepeat = {};

  String _iconProcessPath = '';
  int _processPoints = 0;

// ustalenie do którego kursu należy dany zestaw skilli
// skillset assigned to _editedCourseIndex or _courseIndex
// maybe _editedCOurseIndex can be changed for just _courseIndex
  bool _autoSkillset;
  Map _skillsetUser = {'speaking': 0, 'listening': 0, 'writing': 0, 'reading': 0};
  Map _skillsetDiagnosed = {'speaking': 25, 'listening': 25, 'writing': 25, 'reading': 25};
  String _editedCourseIndex = '';

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
  int get speedTestStrike => _speedTestStrike;

  int get dailyGoal => _dailyGoal;
  List get dailyGoalHistory => _dailyGoalHistory;

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

  Map get wordsLearnt => this._wordsToLearn;
  Map get wordsToRepeat => this._wordsToRepeat;
  List get wordsIgnored => this._wordsIgnored;
  Map get wordsToLearn => this._wordsToLearn;
  String get iconProcessPath => this._iconProcessPath;
  int get processPoints => this._processPoints;
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

      this._skillsetUser = {'speaking': 0, 'listening': 0, 'writing': 0, 'reading': 0};
      this._skillsetDiagnosed = {'speaking': 25, 'listening': 25, 'writing': 25, 'reading': 25};
      this._editedCourseIndex = '';
      notifyListeners();

      await Firestore.instance.collection("users").document(userId).updateData({"courses": this._courses});
    }
  }

///////////////////////////
// set learning process
///////////////////////////

  void setLearningWords({String index = ''}) async {
    if (index.isEmpty) index = this._courseIndex;

    DocumentSnapshot ds = await Firestore.instance.collection("users").document(userId).get();

    if (ds.exists) {
      this._wordsLearnt = ds.data['courses'][index]['words_learnt'];
      this._wordsIgnored = [...ds.data['courses'][index]['words_ignored']];
      this._wordsToLearn = ds.data['courses'][index]['words_to_learn'];
      this._wordsToRepeat = ds.data['courses'][index]['words_to_repeat'];
    }

    notifyListeners();
  }

  void ignoreWordToLearn(String key) async {
    this._wordsToLearn.remove(key);
    this._wordsIgnored.add(key);
    notifyListeners();

    this._courses[this._courseIndex]['words_ignored'] = this._wordsIgnored;
    this._courses[this._courseIndex]['words_to_learn'] = this._wordsToLearn;
    await Firestore.instance.collection("users").document(userId).updateData({"courses": this._courses});
  }

  void setWordsToLearn({int amount = 4}) async {
    this._wordsToLearn = this._courses[this._courseIndex]['words_to_learn'];
    var wordsToAdd = amount - this._wordsToLearn.length;

    if (wordsToAdd == 0) {
      return;
    }

    List keys = this._chosenCourseWords.keys.toList();

    List remainingWordsToLearnKeys = keys.where((key) {
      return !this._wordsIgnored.contains(key) &&
          !this._wordsToRepeat.containsKey(key) &&
          !this._wordsToLearn.containsKey(key) &&
          !this._wordsLearnt.containsKey(key);
    }).toList();

    remainingWordsToLearnKeys.shuffle();

    if (remainingWordsToLearnKeys.length > 0) {
      for (int i = 0; i < remainingWordsToLearnKeys.length; i++) {
        final key = remainingWordsToLearnKeys[i];
        this._wordsToLearn[key] = this._chosenCourseWords[key];
        this._wordsToLearn[key]['good_answers_number'] = 0;

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

  void addGoodAnswer({@required String wordKey}) async {
    this._wordsToLearn[wordKey]['good_answers_number'] += 1;

    if (this._wordsToLearn[wordKey]['good_answers_number'] == 20) {
      print(wordKey + " " + this._wordsToLearn[wordKey]['good_answers_number'].toString());
      this._wordsLearnt[wordKey] = "Haha";
      this._wordsToLearn.remove(wordKey);
    }

    this._courses[this._courseIndex]['words_learnt'] = this._wordsLearnt;
    this._courses[this._courseIndex]['words_to_learn'] = this._wordsToLearn;
    notifyListeners();
    await Firestore.instance.collection("users").document(userId).updateData({"courses": this._courses});
  }

  set iconProcessPath(String iconPath) {
    this._iconProcessPath = iconPath;
    notifyListeners();
  }

  void addToProcessPoints(int points) {
    this._processPoints += points;
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
      this._points = data['points'];

      this._dailyGoal = data['daily_goal'];
      this._dailyGoalHistory = data['daily_goal_history'];

      this._userChallenges = data['challenges'];
      this._courses = data['courses'];
      this._challenge = {'challenge_id': data["challenge_id"]};
    }

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

    this._dailyGoal = 10;
    this._dailyGoalHistory = List<bool>.generate(7, (int index) => false);

    this._challenge = {};
    this._courses = {};

    await Firestore.instance.collection("users").document(uid).setData({
      'username': username,
      'email': email,
      'longest_strike': 0,
      'speed_test_strike': 0,
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

    this._dailyGoal = 10;
    this._dailyGoalHistory = [];

    this._challenge = {};
    this._userChallenges = {};

    this._courses = {};
    this._courseIndex = '';
    this._chosenCourse = {};
    this._chosenCourseWords = {};

    this._autoSkillset = false;
    this._skillsetUser = {'speaking': 0, 'listening': 0, 'writing': 0, 'reading': 0};
    this._skillsetDiagnosed = {'speaking': 25, 'listening': 25, 'writing': 25, 'reading': 25};
    this._editedCourseIndex = '';

    notifyListeners();
  }

  static UserModel of(BuildContext context) => ScopedModel.of<UserModel>(context);
}
