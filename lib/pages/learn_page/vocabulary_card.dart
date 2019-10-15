import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class VocabularyCard extends StatelessWidget {
  final String vocabulary;
  final String translation;
  final bool isKnown;
  final bool isRepeated;
  final bool isIgnored;

  VocabularyCard({
    @required this.vocabulary,
    @required this.translation,
    this.isKnown = false,
    this.isRepeated = false,
    this.isIgnored = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.0),
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
          SizedBox(width: 8.0),
          (isIgnored ? Icon(Icons.block, color: GRAY) : SizedBox()),
          (isRepeated ? Icon(Icons.access_time, color: BROWN_DARK) : SizedBox()),
          (isKnown ? Icon(Icons.check_circle_outline, color: GREEN_LIGHT) : SizedBox()),
        ],
      ),
    );
  }
}
