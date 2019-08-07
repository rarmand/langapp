import 'package:flutter/material.dart';
import 'package:langapp/components/dots/dots.dart';
import 'package:langapp/pages/intro_page/intro.dart';
import 'package:langapp/pages/intro_page/secintro.dart';
import 'package:langapp/pages/intro_page/trdintro.dart';

// TODO: dopracować shadow i wielkość ikonek
class IntroController extends StatefulWidget {
  @override
  _IntroControllerState createState() => _IntroControllerState();
}

class _IntroControllerState extends State<IntroController> {
  final List<Widget> pages = [
    IntroPage(key: PageStorageKey("IntroPage")),
    SecIntroPage(key: PageStorageKey("SecIntroPage")),
    TrdIntroPage(key: PageStorageKey("TrdIntroPage")),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: pages,
            // TODO: płynne przejście kropek
            onPageChanged: (int index) => setState(() => _selectedIndex = index),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 15),
              child: Dots(chosen: this._selectedIndex),
            ),
          ),
        ],
      ),
    );
  }
}
