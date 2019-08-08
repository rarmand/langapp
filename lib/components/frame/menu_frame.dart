import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:langapp/components/appbar_upper/appbar_upper.dart';

class MenuFrame extends StatelessWidget {
  final String title;
  Widget child;
  bool isAppBar = true;

  MenuFrame({this.title = "", @required this.child}) {
    if (this.title.length == 0) isAppBar = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isAppBar
          ? AppBarUpper(
              title: this.title,
              onLogoTap: () => Navigator.pushNamedAndRemoveUntil(
                context,
                "/",
                (Route<dynamic> route) => false,
              ),
            )
          : null,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(child: this.child),
          ),
        ],
      ),
    );
  }
}
