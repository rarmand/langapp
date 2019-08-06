import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:langapp/styles/colors.dart';

class AppBarUpper extends StatelessWidget implements PreferredSizeWidget {
  final Widget logo = SvgPicture.asset('assets/logo_small.svg');
  final String title;

  AppBarUpper({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: BROWN_SHADOW_25,
          offset: Offset(0, SHADOW_OFFSET),
          blurRadius: SHADOW_RADIUS,
        )
      ]),
      child: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          this.title,
          style: TextStyle(
            color: BROWN_DARK,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: InkWell(
            child: Container(
              child: logo,
            ),
            onTap: () {
              print("click icon");
            }),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
