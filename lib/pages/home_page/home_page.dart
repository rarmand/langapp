import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:langapp/components/appbar_upper/appbar_upper.dart';
import 'package:langapp/components/menu_bottom/menu_bottom.dart';
import 'package:langapp/components/panel_points/panel_points.dart';
import 'package:langapp/styles/colors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUpper(title: "Home"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          PanelPoints(),
          MenuBottom(),
        ],
      ),
    );
  }
}
