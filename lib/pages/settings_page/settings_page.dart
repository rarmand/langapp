import 'package:flutter/material.dart';
import 'package:langapp/components/frame/menu_frame.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MenuFrame(
      title: "Settings",
      chosen: 3,
      child: Column(
        children: <Widget>[
          SizedBox(height: 24.0),
          Text("hehe"),
          SizedBox(height: 24.0),
        ],
      ),
    );
  }
}
