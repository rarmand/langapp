import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model {
  //
  // data
  //

  String _userId = 't0aEzrSxuZcxMtp5GMX2hhzM7ed2';
  String _username = '';
  String _email = '';
  String _language = 'french';

  int _points = 555;
  int _longestStrike;
  int _speedTestsStrike;

  int _dailyGoal = 10;
  List _dailyGoalHistory = [];

// challenges
  Map _challenge = {
    'challenge_id': '',
    'title': '',
    'description': '',
  };

  Map _userChallenges = {};

// kursy

  Map _courses = {};

// ustalenie do którego kursu należy dany zestaw skilli
  bool _autoSkillset;
  Map _skillsetUser = {
    'speaking': 0,
    'listening': 0,
    'writing': 0,
    'reading': 0,
  };
  Map _skillsetDiagnosed = {
    'speaking': 25,
    'listening': 25,
    'writing': 25,
    'reading': 25,
  };
  String _editedCourseIndex = '';

  //
  // getters
  //

  String get userId => _userId;
  String get username => _username;
  String get email => _email;
  String get language => _language;

  int get points => _points;
  int get longestStrike => _longestStrike;
  int get speedTestsStrike => _speedTestsStrike;

  int get dailyGoal => _dailyGoal;
  List get dailyGoalHistory => _dailyGoalHistory;

  Map get challenge => _challenge;
  Map get userChallenges => _userChallenges;

  Map get courses => _courses;

  // skills

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
      'username': this._username,
    });
    notifyListeners();
  }

  void setEmail({String email}) async {
    this._email = email;
    await Firestore.instance.collection("users").document(this._userId).updateData({'email': this._email});

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

  void setPoints({int points}) {
    this._points = points;
    notifyListeners();
  }

  void setSpeedTestsStrike({int strike}) async {
    this._speedTestsStrike = strike;
    await Firestore.instance
        .collection("users")
        .document(this._userId)
        .updateData({"speed_test_strike": this._speedTestsStrike});

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

// set skillset

  void setAutoMethod({bool isAuto, String index}) async {
    this._courses[index]['skills']['auto'] = isAuto;
    await Firestore.instance.collection('users').document(this._userId).updateData({'courses': this._courses});

    this._autoSkillset = isAuto;
    notifyListeners();
  }

  void setSkillsetUser({Map skillset}) {
    this._skillsetUser = skillset;
    notifyListeners();
  }

  void setSkillUser({String key, int value}) async {
    this._skillsetUser[key] = value;

    this._courses[this._editedCourseIndex]['skills'][key] = value;
    await Firestore.instance.collection('users').document(this._userId).updateData({'courses': this._courses});

    notifyListeners();
  }

  void setDiagnosedSkillset({Map skillset}) {
    this._skillsetDiagnosed = skillset;
    notifyListeners();
  }

  void setSkillset({String index}) {
    Map course = this._courses[index];
    Map diagnosedSkillset = {};
    Map userSkillset = {};

    diagnosedSkillset['reading'] = course['skills']['reading_auto'];
    diagnosedSkillset['listening'] = course['skills']['listening_auto'];
    diagnosedSkillset['speaking'] = course['skills']['speaking_auto'];
    diagnosedSkillset['writing'] = course['skills']['writing_auto'];

    userSkillset['reading'] = course['skills']['reading'];
    userSkillset['listening'] = course['skills']['listening'];
    userSkillset['speaking'] = course['skills']['speaking'];
    userSkillset['writing'] = course['skills']['writing'];

    this._autoSkillset = course['skills']['auto'];

    this._skillsetDiagnosed = diagnosedSkillset;
    this._skillsetUser = userSkillset;

    notifyListeners();
  }

  void setEditedCourseSkillsetIndex({@required String index}) {
    this._editedCourseIndex = index;
    notifyListeners();
  }

///////////////////////////
  ///
  ///
  void setUserData({String uid = ''}) async {
    if (uid.length > 0) this._userId = uid;
    this._points = 0;

    DocumentSnapshot ds = await Firestore.instance.collection("users").document(this._userId).get();

    if (ds.exists) {
      Map data = ds.data;

      this._email = data['email'];
      this._username = data['username'];
      this._longestStrike = data['longest_strike'];
      this._speedTestsStrike = data['speed_test_strike'];

      this._dailyGoal = data['daily_goal'];
      this._dailyGoalHistory = data['daily_goal_history'];

      this._userChallenges = data['challenges'];
      this._courses = data['courses'];
      this._challenge = {'challenge_id': data["challenge_id"]};

      if (this._courses.length > 0) {
        this._courses.forEach((index, dataMap) {
          this._points += dataMap['points'];
        });

        // wycena challenge'a = 500 points
        this._points += this._userChallenges.length * 500;
      }
    }

    notifyListeners();
  }

  void setNewUserData({@required String uid, @required String username, @required String email}) async {
    this._userId = uid;
    this._email = email;
    this._username = username;

    this._points = 0;
    this._longestStrike = 0;
    this._speedTestsStrike = 0;

    this._dailyGoal = 10;
    this._dailyGoalHistory = List<bool>.generate(7, (int index) => false);

    this._challenge = {};
    this._courses = {};

    await Firestore.instance.collection("users").document(uid).setData({
      'username': username,
      'email': email,
      'longest_strike': 0,
      'speed_test_strike': 0,
      'courses': {},
      'daily_goal': this._dailyGoal,
      'daily_goal_history': this._dailyGoalHistory,
      'challenges': {},
      'challenge_id': 0,
    });

    notifyListeners();
  }

  void deleteUserData() {
    this._userId = '';
    this._username = '';
    this._email = '';
    this._language = '';

    this._points = 0;
    this._longestStrike = 0;
    this._speedTestsStrike = 0;

    this._dailyGoal = 10;
    this._dailyGoalHistory = [];

    notifyListeners();
  }

  static UserModel of(BuildContext context) => ScopedModel.of<UserModel>(context);
}
