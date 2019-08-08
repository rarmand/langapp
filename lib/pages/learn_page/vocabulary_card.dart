import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class VocabularyCard extends StatelessWidget {
  final String vocabulary;
  final String translation;
  bool isKnown;

  VocabularyCard({
    @required this.vocabulary,
    @required this.translation,
    @required this.isKnown,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: BROWN_DARK,
        ),
        borderRadius: BorderRadius.circular(BTN_RADIUS / 2),
      ),
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  this.vocabulary,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.clip,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                Text(
                  this.translation,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.clip,
                  style: TextStyle(color: BLACK.withOpacity(0.5)),
                ),
              ],
            ),
          ),
          SizedBox(width: 10.0),
          // if the vocab is known by the user
          // if yes - checked
          // if no - no check
          (isKnown ? Icon(Icons.check, color: GREEN_LIGHT) : SizedBox()),
        ],
      ),
    );
  }
}
