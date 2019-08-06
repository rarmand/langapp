import 'package:flutter/material.dart';
import 'package:langapp/components/element_content/element_subtitle.dart';
import 'package:langapp/components/element_content/element_title.dart';

class ElementContent extends StatelessWidget {
  final String title;
  final String subtitle;
  Widget element;

  ElementContent({this.title = "", this.subtitle = "", @required this.element});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Column(
        children: <Widget>[
          (this.title.length > 0
              ? Container(
                  padding: EdgeInsets.only(
                    top: 5.0,
                    bottom: 5.0,
                  ),
                  child: ElementTitle(title: this.title),
                )
              : SizedBox()),
          (this.subtitle.length > 0 ? ElementSubtitle(subtitle: this.subtitle) : SizedBox()),
          this.element,
        ],
      ),
    );
  }
}
