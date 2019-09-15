import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model {
  String _userId = 't0aEzrSxuZcxMtp5GMX2hhzM7ed2';
  String _username = '';
  String _email = '';
  String _language = 'french';
  int _dailyGoal = 10;
  int _points = 0;

  String get userId => _userId;
  String get username => _username;
  String get email => _email;
  String get language => _language;

  int get dailyGoal => _dailyGoal;
  int get points => _points;

  void setUserId({String uid}) {
    this._userId = uid;
    notifyListeners();
  }

  void setUsername({String username}) {
    this._username = username;
    notifyListeners();
  }

  void setEmail({String email}) {
    this._email = email;
    notifyListeners();
  }

  void setLanguage({String language}) {
    this._language = language;
    notifyListeners();
  }

  void setDailyGoal({int dailyGoal}) {
    this._dailyGoal = dailyGoal;
    notifyListeners();
  }

  void setPoints({int points}) {
    this._points = points;
    notifyListeners();
  }

  static UserModel of(BuildContext context) => ScopedModel.of<UserModel>(context);
}
