import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:langapp/components/frame/menu_frame.dart';
import 'package:langapp/components/profile_elements/profile_content.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuFrame(
      title: "Profile",
      child: ProfileContent(),
    );
  }
}
