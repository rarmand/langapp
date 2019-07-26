import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:langapp/components/appbar_upper/appbar_upper.dart';

class MenuFrame extends StatelessWidget {
  final String title;
  final int chosen;
  Widget child;
  bool isAppBar = true;
  bool isMenuBottom = true;

  MenuFrame({this.title = "", this.chosen = -1, @required this.child}) {
    // TODO: czy wywalić check czy istnieje menu i title
    if (this.title.length == 0) isAppBar = false;
    if (this.chosen == -1) isMenuBottom = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isAppBar ? AppBarUpper(title: this.title) : null,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(child: this.child),
          ),
          // (isMenuBottom ? MenuBottom(chosen: this.chosen) : SizedBox()),
        ],
      ),
    );
  }
}
