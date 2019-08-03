import 'package:flutter/material.dart';
import 'package:langapp/components/button_outlined/button_outlined.dart';
import 'package:langapp/components/logo/arrow.dart';
import 'package:langapp/components/logo/logo_small.dart';

import 'menu_frame.dart';

class WelcomeFrame extends StatelessWidget {
  final Widget child;
  final Widget title;
  final double bottomHeight;
  final bool logoWithArrow;
  final Function onPressedNext;
  final Function onPressedBack;

  WelcomeFrame({
    @required this.child,
    @required this.title,
    this.bottomHeight = 45,
    this.logoWithArrow = true,
    this.onPressedNext,
    this.onPressedBack,
  });

  @override
  Widget build(BuildContext context) {
    return MenuFrame(
      child: Center(
        child: Column(
          children: <Widget>[
            (logoWithArrow ? Arrow(child: LogoSmall(), onPressed: this.onPressedBack) : LogoSmall()),
            title,
            this.child,
            SizedBox(height: this.bottomHeight),
            ButtonOutlined(
              btnText: "Next",
              onPressed: this.onPressedNext,
            ),
            SizedBox(height: this.bottomHeight / 2),
          ],
        ),
      ),
    );
  }
}
