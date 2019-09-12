import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model {
  String _userId = 't0aEzrSxuZcxMtp5GMX2hhzM7ed2';
  String _username = 'olaf';
  String _email = 'olaholik56@interia.pl';
  int _dailyGoal = 10;

  String get userId => _userId;
  String get username => _username;
  String get email => _email;
  int get dailyGoal => _dailyGoal;

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

  void setDailyGoal({int dailyGoal}) {
    this._dailyGoal = dailyGoal;
    notifyListeners();
  }

  static UserModel of(BuildContext context) => ScopedModel.of<UserModel>(context);
}
