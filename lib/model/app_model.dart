import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model {
  String _userId = '';
  String _username = '';

  String get userId => _userId;
  String get username => _username;

  void setUserId({String uid}) {
    _userId = uid;
    notifyListeners();
  }

  void setUsername({String username}) {
    _username = username;
    notifyListeners();
  }

  static UserModel of(BuildContext context) => ScopedModel.of<UserModel>(context);
}
