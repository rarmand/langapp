import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:langapp/components/appbar_upper/appbar_upper.dart';
import 'package:langapp/components/menu_bottom/menu_bottom.dart';
import 'package:langapp/pages/profile_page/profile_content.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUpper(title: "Profile"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // TODO: można dookreślić typ przyjmowanych danych
          Expanded(child: ProfileContent()),
          MenuBottom(chosen: 2),
        ],
      ),
    );
  }
}
