import 'package:flutter/material.dart';

import 'package:langapp/components/frame/learning_frame.dart';

import 'package:langapp/pages/learn_page/new_word_page.dart';

// TODO: do poprawienia przekazywanie informacji o tytule
class LearnPageController extends StatefulWidget {
  final String courseTitle;

  LearnPageController({@required this.courseTitle});

  @override
  _LearnPageControllerState createState() => _LearnPageControllerState(courseTitle: this.courseTitle);
}

class _LearnPageControllerState extends State<LearnPageController> {
  final List<Widget> pages = [
    NewWordPag(key: PageStorageKey("12")),
  ];

  int _selectedIndex = 0;
  final String courseTitle;

  _LearnPageControllerState({@required this.courseTitle});

  @override
  Widget build(BuildContext context) {
    return LearningFrame(
      courseTitle: this.courseTitle,
      child: Stack(
        children: <Widget>[
          PageView(
            children: this.pages,
            onPageChanged: (int index) => setState(() => _selectedIndex = index),
          )
        ],
      ),
    );

    // Scaffold(
    //   appBar: AppBarUpper(
    //     title: this.courseTitle,
    //     isCourseAppBar: true,
    //     onLogoTap: () => Navigator.pushNamedAndRemoveUntil(context, "/", (Route<dynamic> route) => false),
    //     onClosePressed: () => Navigator.pushNamedAndRemoveUntil(context, "/", (Route<dynamic> route) => false),
    //   ),
    //   body: Stack(
    //     children: [
    //       PageView(
    //         children: pages,
    //         // TODO: płynne przejście kropek
    //         onPageChanged: (int index) => setState(() => _selectedIndex = index),
    //       ),
    //       Positioned(
    //         bottom: 30,
    //         left: 0,
    //         right: 0,
    //         child: Container(
    //           alignment: Alignment.center,
    //           padding: EdgeInsets.only(top: 15),
    //           child: Dots(chosen: this._selectedIndex),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
