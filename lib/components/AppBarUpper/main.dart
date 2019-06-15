import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarUpper extends StatelessWidget {
  final Widget logo = SvgPicture.asset('assets/logo_small.svg');

  final String title;

  AppBarUpper({@required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(this.title),
      // TODO! nie wiadomo jak przesunąć
      leading: InkWell(
          child: Container(
            child: logo,
          ),
          onTap: () {
            print("click icon");
          }),
    );
  }
}
