import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class VocabularyCard extends StatelessWidget {
  final String vocabulary;
  final String translation;
  final String helpText;
  final bool isKnown;
  final bool isRepeated;
  final bool isIgnored;

  VocabularyCard({
    @required this.vocabulary,
    @required this.translation,
    this.helpText = "",
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
      child: Column(
        children: <Widget>[
          Row(
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
                    const SizedBox(height: 10.0),
                    Text(
                      this.translation,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.clip,
                      style: TextStyle(color: BLACK.withOpacity(0.5)),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8.0),
              (isIgnored ? Icon(Icons.block, color: GRAY) : SizedBox()),
              (isRepeated ? Icon(Icons.access_time, color: BROWN_DARK) : SizedBox()),
              (isKnown ? Icon(Icons.check_circle_outline, color: GREEN_LIGHT) : SizedBox()),
            ],
          ),
          ((this.helpText == null || this.helpText.isEmpty)
              ? SizedBox()
              : Container(
                  padding: EdgeInsets.only(top: 24.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    this.helpText,
                    style: TextStyle(
                      color: BLACK,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                )),
        ],
      ),
    );
  }
}
