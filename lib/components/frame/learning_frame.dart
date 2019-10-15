import 'package:flutter/material.dart';
import 'package:langapp/components/appbar_upper/appbar_upper.dart';
import 'package:langapp/components/learning_process/learning_label.dart';
import 'package:langapp/components/modals/learning_choice_modal.dart';

class LearningFrame extends StatelessWidget {
  final Widget child;
  final int point;
  final String title;

  LearningFrame({@required this.child, this.point = 4, @required this.title});

  void _onLogoTap(BuildContext context) =>
      Navigator.pushNamedAndRemoveUntil(context, "/", (Route<dynamic> route) => false);

  void _onClosePressed(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, "/", (Route<dynamic> route) => false);
    Navigator.of(context).push(PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __) => LearningChoiceModal(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUpper(
        title: this.title,
        isCourseAppBar: true,
        onLogoTap: () => this._onLogoTap(context),
        onClosePressed: () => this._onClosePressed(context),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LearningLabel(point: this.point),
              Container(
                margin: EdgeInsets.fromLTRB(24, 0, 24, 0),
                child: this.child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
