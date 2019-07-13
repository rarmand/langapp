import 'package:flutter/material.dart';
import 'package:langapp/components/element_content/element_title.dart';

class ElementContent extends StatelessWidget {
  final String title;
  Widget element;

  ElementContent({@required this.title, @required this.element});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Column(
        children: <Widget>[
          ElementTitle(title: this.title),
          this.element,
        ],
      ),
    );
  }
}
