import 'package:flutter/material.dart';
import 'package:langapp/components/frame/menu_frame.dart';

class ChallengePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MenuFrame(
      title: "Challenge",
      chosen: 1,
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
