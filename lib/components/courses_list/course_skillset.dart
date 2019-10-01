import 'package:flutter/material.dart';
import 'package:langapp/components/modals/skillset_page.dart';
import 'package:langapp/styles/colors.dart';

class CourseSkillset extends StatelessWidget {
  final String index;
  final bool isNewCourse;

  CourseSkillset({@required this.index, this.isNewCourse = false});

  void _onTap(BuildContext context) {
    Navigator.of(context).push(PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __) => SkillsetPage(index: this.index),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Color color = (isNewCourse ? BROWN_SHADOW_25.withAlpha(128) : WHITE);

    return Container(
      child: FlatButton.icon(
        icon: Icon(
          Icons.bubble_chart,
          color: color,
          size: 32.0,
        ),
        label: Text(
          "Skillset",
          style: TextStyle(
            color: color,
            letterSpacing: 0.4,
            fontWeight: FontWeight.w700,
          ),
        ),
        shape: Border(
          left: BorderSide(width: 0.6, color: color),
          right: BorderSide(width: 0.6, color: color),
        ),
        onPressed: (this.isNewCourse ? null : () => this._onTap(context)),
      ),
    );
  }
}
