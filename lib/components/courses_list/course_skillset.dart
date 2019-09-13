import 'package:flutter/material.dart';
import 'package:langapp/components/modals/skillset_page.dart';
import 'package:langapp/styles/colors.dart';

class CourseSkillset extends StatelessWidget {
  final int index;
  CourseSkillset({@required this.index});

  void _onTap(BuildContext context) {
    Navigator.of(context).push(PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __) => SkillsetPage(index: this.index),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton.icon(
        icon: Icon(
          Icons.bubble_chart,
          color: WHITE,
          size: 32.0,
        ),
        label: Text(
          "Skillset",
          style: TextStyle(
            color: WHITE,
            letterSpacing: 0.4,
            fontWeight: FontWeight.w700,
          ),
        ),
        shape: Border(
          left: BorderSide(width: 0.6, color: WHITE),
          right: BorderSide(width: 0.6, color: WHITE),
        ),
        onPressed: () => this._onTap(context),
      ),
    );
  }
}
