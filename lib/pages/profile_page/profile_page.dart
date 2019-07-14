import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:langapp/components/frame/frame.dart';
import 'package:langapp/pages/profile_page/profile_content.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Frame(title: "Profile", chosen: 2, child: ProfileContent());
  }
}
